<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ChatRoom._Default" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login</title>
    <link href="Styles/Style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function getWidth() {
            var intViewportWidth = window.innerWidth;
            var w = window.innerWidth;
            var h = window.innerHeight;
            var ow = window.outerWidth; //including toolbars and status bar etc.
            var oh = window.outerHeight;
            if (window.matchMedia("(min-width: 400px)").matches) {
                /* the viewport is at least 400 pixels wide */
            }
            else {
                /* the viewport is less than 400 pixels wide */
            }
            if (self.innerWidth) {
                return self.innerWidth;
            }
            if (document.documentElement && document.documentElement.clientWidth) {
                return document.documentElement.clientWidth;
            }
            if (document.body) {
                return document.body.clientWidth;
            }
        }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            // See if this is a touch device
            if ('ontouchstart' in window) {
                // Set the correct body class
                $('body').removeClass('no-touch').addClass('touch');

                // Add the touch toggle to show text
                $('div.boxInner img').click(function () {
                    $(this).closest('.boxInner').toggleClass('touchFocus');
                });
            }
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            z-index: 101;
            left: 40px;
            width: 440px;
            position: absolute;
            top: 32px;
            height: 158px;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <table id="Table1" cellspacing="0" cellpadding="0" border="0" class="auto-style2">
            <tr>
                <td style="width: 84px">
                </td>
                <td style="width: 164px" class="auto-style1">
                        <img alt="" src="images/logo.JPG" /></td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 84px">
                    <asp:Label ID="Label1" runat="server">帳號*</asp:Label></td>
                <td style="width: 164px">
                    <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="警告：必填！"
                        ControlToValidate="TextBoxUserName"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 84px">
                    <asp:Label ID="Label2" runat="server">密碼*</asp:Label></td>
                <td style="width: 164px">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="警告：必填！"
                        ControlToValidate="TextBoxPassword"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="ButtonLogin" runat="server" Width="56px" Text="登入" OnClick="ButtonLogin_Click">
                    </asp:Button>&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://portfoliowebapplication.azurewebsites.net/">回作品集</asp:HyperLink>
                </td>
            </tr>
        </table>
        &nbsp;
    </form>
</body>
</html>