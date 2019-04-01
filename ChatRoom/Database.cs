using System;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ChatRoom
{
    public class Database : IDisposable
    {
        /// <summary>
        /// 保护变量，数据库连接。
        /// </summary>
        protected SqlConnection Connection;

        /// <summary>
        /// 保护变量，数据库连接串。
        /// </summary>
        protected String ConnectionString;

        /// <summary>
        /// 构造函数。
        /// </summary>
        /// <param name="DatabaseConnectionString">数据库连接串</param>
        public Database()
        {
            ConnectionString = ConfigurationManager.AppSettings["DBConnectionString"];
        }

        /// <summary>
        /// 析构函数，释放非托管资源
        /// </summary>
        ~Database()
        {
            try
            {
                if (Connection != null)
                    Connection.Close();
            }
            catch { }
            try
            {
                Dispose();
            }
            catch { }
        }

        /// <summary>
        /// 保护方法，打开数据库连接。
        /// </summary>
        protected void Open()
        {
            if (Connection == null)
            {
                Connection = new SqlConnection(ConnectionString);
            }
            if (Connection.State.Equals(ConnectionState.Closed))
            {
                Connection.Open();
            }
        }

        /// <summary>
        /// 公有方法，关闭数据库连接。
        /// </summary>
        public void Close()
        {
            if (Connection != null)
                Connection.Close();
        }

        /// <summary>
        /// 公有方法，释放资源。
        /// </summary>
        public void Dispose()
        {
            // 确保连接被关闭
            if (Connection != null)
            {
                Connection.Dispose();
                Connection = null;
            }
        }

        /// <summary>
        /// 公有方法，获取数据，返回一个DataSet。
        /// </summary>
        /// <param name="SqlString">Sql语句</param>
        /// <returns>DataSet</returns>
        public DataSet GetDataSet(String SqlString)
        {
            Open();
            SqlDataAdapter adapter = new SqlDataAdapter(SqlString, Connection);
            DataSet dataset = new DataSet();
            adapter.Fill(dataset);
            Close();
            return dataset;
        }

        /// <summary>
        /// 公有方法，获取数据，返回一个DataRow。
        /// </summary>
        /// <param name="SqlString">Sql语句</param>
        /// <returns>DataRow</returns>
        public DataRow GetDataRow(String SqlString)
        {
            DataSet dataset = GetDataSet(SqlString);
            dataset.CaseSensitive = false;
            if (dataset.Tables[0].Rows.Count > 0)
            {
                return dataset.Tables[0].Rows[0];
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 公有方法，执行Sql语句。
        /// </summary>
        /// <param name="SqlString">Sql语句</param>
        /// <returns>对Update、Insert、Delete为影响到的行数，其他情况为-1</returns>
        public int ExecuteSQL(String SqlString)
        {
            int count = -1;
            Open();
            try
            {
                SqlCommand cmd = new SqlCommand(SqlString, Connection);
                count = cmd.ExecuteNonQuery();
            }
            catch
            {
                count = -1;
            }
            finally
            {
                Close();
            }
            return count;
        }
    }
}