using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChatRoom
{
    public partial class ShowMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }

        private void InitData()
        {
            //樓婥郔輪腔10沭隱晟
            DataSet ds = Message.LoadTop10();

            //紨沭珆尨
            if (ds != null)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Response.Write("<font color=" + dr["Color"].ToString() + ">");  //颜色
                    Response.Write(dr["CreateTime"].ToString());                //发言时间
                    Response.Write("【" + dr["UserName"].ToString() + "】");          //发言用户
                    Response.Write(dr["Emotion"].ToString());                   //表情
                    Response.Write("說：");
                    Response.Write(dr["Content"].ToString());                   //发言内容
                    Response.Write("</font><br>");
                }
            }
        }
    }
}