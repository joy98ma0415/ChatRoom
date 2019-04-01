using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChatRoom
{
    public partial class Speak : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonSpeak_Click(object sender, EventArgs e)
        {
            string userName = Session["user_name"].ToString();      //用户名
            string createTime = System.DateTime.Now.ToLongTimeString();//发言时间
            string content = TextBoxContent.Text;                       //发言内容
            string color = DropDownListColor.SelectedItem.Value;        //颜色
            string emotion = DropDownListEmotion.SelectedItem.Value;    //表情

            Message message = new Message();            //实例化Message类
            message.Add(userName, createTime, content, color, emotion);     //利用Message类的Add方法，向数据库添加留言
                                                                            //清空发言框
            TextBoxContent.Text = "";
        }

        protected void ButtonExit_Click(object sender, EventArgs e)
        {
            Session["user_name"] = null;            //销毁Session中的用户信息
            Response.Write("<Script Language=JavaScript>window.top.location=\"Default.aspx\";</Script>");
        }
    }
}