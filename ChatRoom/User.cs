using System;
using System.Data;

namespace ChatRoom
{
    public class User
    {
        #region 私有成员

        private string _userName;   //用户名
        private string _password;   //用户密码

        private bool _exist;        //是否存在标志

        #endregion 私有成员

        #region 属性

        public string UserName
        {
            set
            {
                this._userName = value;
            }
            get
            {
                return this._userName;
            }
        }

        public string Password
        {
            set
            {
                this._password = value;
            }
            get
            {
                return this._password;
            }
        }

        public bool Exist
        {
            get
            {
                return this._exist;
            }
        }

        #endregion 属性

        #region 方法

        /// <summary>
        /// 根据参数userName，获取用户详细信息
        /// </summary>
        /// <param name="userName">用户名</param>
        public void LoadData(string userName)
        {
            Database db = new Database();       //实例化一个Database类

            string sql = "Select * from [User] where UserName = '" + userName + "'";
            DataRow dr = db.GetDataRow(sql);    //利用Database类的GetDataRow方法查询用户数据

            //根据查询得到的数据，对成员赋值
            if (dr != null)
            {
                this._userName = dr["UserName"].ToString();
                this._password = dr["Password"].ToString();
                this._exist = true;
            }
            else
                this._exist = false;
        }

        /// <summary>
        /// 向数据库添加一个用户
        /// </summary>
        /// <param name="userName">用户名</param>
        /// <param name="password">密码</param>
        public void Add(string userName, string password)
        {
            Database db = new Database();       //实例化一个Database类

            string sql = "Insert Into [User] Values( "
                + "'" + userName + "',"
                + "'" + password + "')";

            db.ExecuteSQL(sql); //利用Database类的GetDataRow方法查询用户数据
        }

        #endregion 方法
    }
}