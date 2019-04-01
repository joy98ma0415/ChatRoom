using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ChatRoom
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string userName = TextBoxUserName.Text; //蚚誧靡
            string password = TextBoxPassword.Text; //躇鎢
            Session.Add("user_name", userName);     //妏蚚Session懂悵湔蚚誧靡陓洘
            User user = new User();         //妗瞰趙User濬
            user.LoadData(userName);        //瞳蚚User濬腔LoadData源楊ㄛ鳳蚚誧陓洘

            if (user.Exist) //彆岆橾蚚誧
            {
                if (user.Password == password)  //彆蚚誧磁楊ㄛ蛌謐毞弅翋珜醱
                {
                    Response.Redirect("Main.aspx");
                }
                else        //彆躇鎢渣昫ㄛ跤堤枑尨
                {
                    Response.Write("<Script Language=JavaScript>alert(\"驗證失敗，請重新登入！\")</Script>");
                }
            }
            else            //彆岆陔蚚誧
            {
                user.Add(userName, password);       //瞳蚚User濬腔Add源楊ㄛ氝樓陔蚚誧
                Response.Redirect("Main.aspx");         //蛌善翋珜醱
            }
        }

        protected void ButtonExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://portfoliowebapplication.azurewebsites.net/");
        }
    }
}