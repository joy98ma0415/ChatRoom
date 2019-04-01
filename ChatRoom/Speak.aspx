<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Speak.aspx.cs" Inherits="ChatRoom.Speak" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Speak</title>
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
    <style type="text/css">
        .auto-style1 {
            z-index: 105;
            left: 366px;
            position: absolute;
            top: 88px;
        }
        .auto-style2 {
            z-index: 102;
            left: 260px;
            position: absolute;
            top: 89px;
            right: 903px;
        }
        .auto-style3 {
            z-index: 103;
            left: 126px;
            position: absolute;
            top: 95px;
            right: 1020px;
        }
        .auto-style4 {
            z-index: 104;
            left: 18px;
            position: absolute;
            top: 96px;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:TextBox ID="TextBoxContent" Style="z-index: 101; left: 16px; position: absolute; top: 16px"
            runat="server" TextMode="MultiLine" Height="64px" Width="416px" EnableViewState="False"></asp:TextBox>
        <asp:Button ID="ButtonSpeak"
            runat="server" Text="發言" Width="64px" OnClick="ButtonSpeak_Click" CssClass="auto-style2"></asp:Button>
        <asp:DropDownList ID="DropDownListEmotion"
            runat="server" CssClass="auto-style3">
            <asp:ListItem Value="開心的">開心的</asp:ListItem>
            <asp:ListItem Value="驚訝的">驚訝的</asp:ListItem>
            <asp:ListItem Value="低落的">低落的</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownListColor"
            runat="server" CssClass="auto-style4">
            <asp:ListItem Value="black" Selected="True">黑色</asp:ListItem>
            <asp:ListItem Value="red">紅色</asp:ListItem>
            <asp:ListItem Value="blue">藍色</asp:ListItem>
            <asp:ListItem Value="green">綠色</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="ButtonExit"
            runat="server" Text="離開" Width="64px" OnClick="ButtonExit_Click" CssClass="auto-style1"></asp:Button>
    </form>
</body>
</html>