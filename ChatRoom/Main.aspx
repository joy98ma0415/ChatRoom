<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ChatRoom.Main" %>

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>主網頁</title>
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
    <link href="Styles/Style.css" type="text/css" rel="stylesheet" />
</head>

<body>
    <h2>*MyChatRoom*</h2>
    <form id="Form1" method="post" runat="server">
        <table>
            <tr>
                <td style="width: 500px">
                    <iframe src="ShowMessage.aspx" width="100%" height="100%"></iframe>
                </td>
            </tr>
            <tr>
                <td style="width: 500px">
                    <iframe src="Speak.aspx" width="100%" height="100%"></iframe>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>