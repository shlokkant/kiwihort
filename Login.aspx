﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Login</title>

    <link href="login.css" rel="stylesheet" />
    <link href="main.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
    
    

    <div class="navTitle">
        <img src="img/logoTest.png" class="logoImage"/>
    </div>

    <ul class="nav">
        <!--<li class="padding navsToHide" style="float:right"><a href="#about" onclick="modal('signupModal', true, '0.7s')">SIGN UP</a></li>-->
        <!--<li class="navsToHide" style="float:right"><a href="#" onclick="modal('loginModal', true, '0.7s')">LOGIN</a></li>-->
        <li class="padding navsToHide" style="float:right"><a href="register.aspx">SIGN UP</a></li>
        <li class="navsToHide" style="float:right"><a href="login.aspx">LOGIN</a></li>
        <li class="navsToHide" style="float:right"><a href="home.aspx">CONTACT</a></li>
        <li class="navsToHide" style="float:right"><a href="home.aspx">BENEFITS</a></li>
        <li class="navsToHide" style="float:right"><a href="home.aspx">FEATURES</a></li>
        <li class="navsToHide" style="float:right"><a href="home.aspx">ABOUT</a></li>
        <li class="navsToHide" style="float:right"><a href="home.aspx">HOME</a></li>
        <!--<li class="navsToHide" style="float:right"><a href="#" onclick="modal('employeeInfoModal', true, '0.7s'); checkDays()">TEST</a></li>-->
    </ul>

    <div style="float:right" class="responsiveIcon"><a href="#" onclick="responsiveIcon()">☰</a></div>

    <div class="responsiveNav">
        <ul class="nav-small">
            <li><a href="home.aspx">HOME</a></li>
            <li><a href="home.aspx#about">ABOUT</a></li>
            <li><a href="home.aspx">FEATURES</a></li>
            <li><a href="home.aspx">BENEFITS</a></li>
            <li><a href="home.aspx">CONTACT</a></li>
            <!--<li><a href="#" onclick="modal('loginModal', true, '0.7s')">LOGIN</a></li>
            <li><a href="#about" onclick="modal('signupModal', true, '0.7s')">SIGN UP</a></li>-->
            <li><a href="login.aspx">LOGIN</a></li>
            <li><a href="register.aspx">SIGN UP</a></li>
        </ul>
    </div>
        <div class="entire-background">
    <div class="moveAll" style="background-color:transparent">
            <div class="heading" style="background-color:transparent">
                <h3 style="text-align: center; margin-top: 20px; margin-bottom:20px;">Login</h3>
            </div>
            
            <div class="row" style="background-color:transparent">
                <div class="cell cell-12 login-container">
                    <form name="login-form" class="login-form" runat="server" style="background-color:transparent">
                        <asp:DropDownList ID="cbo_loginAs" class="login-input email-input" runat="server">
                            <asp:ListItem>Worker</asp:ListItem>
                            <asp:ListItem>Contractor</asp:ListItem>
                            <asp:ListItem>Supervisor</asp:ListItem>
                            <asp:ListItem>Monitor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txt_email" class="login-input email-input" placeholder="Email" runat="server" ValidateRequestMode="Enabled" required="true"></asp:TextBox>
                        <asp:TextBox ID="txt_password" class="login-input password-input" placeholder="Password" runat="server" TextMode="Password" required="true"></asp:TextBox>
                        <asp:Button ID="btn_submit" class="login-input submit-input" runat="server" Text="LOGIN" OnClick="btn_submit_Click" />
                        <a href="Forgotpassword.aspx" style= "float:left" class="extra-actions">Forgot Password?</a>
                        <a href="register.aspx" style= "float:right" class="extra-actions">Register</a>
                    </form>
                </div>
            </div>
    </div>
            </div>


</body>
</html>
