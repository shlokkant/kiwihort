﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,500|Varela+Round" rel="stylesheet"/>
    <title>Kiwihort - Farmer Management Solutions</title>
    <link rel="stylesheet" href="main.css"/>
</head>
<body onload="msieversion();">
    <script src="js/jquery.js"></script>
    <script src="js/main.js"></script>

    <div id="modalBackground" onclick="closeAllModals()"></div>

    <div class="navTitle">
        <img src="img/logoTest.png" class="logoImage">
    </div>

    <ul class="nav">
        <!--<li class="padding navsToHide" style="float:right"><a href="#about" onclick="modal('signupModal', true, '0.7s')">SIGN UP</a></li>-->
        <!--<li class="navsToHide" style="float:right"><a href="#" onclick="modal('loginModal', true, '0.7s')">LOGIN</a></li>-->
        <li class="padding navsToHide" style="float:right"><a href="register.aspx">SIGN UP</a></li>
        <li class="navsToHide" style="float:right"><a href="login.aspx">LOGIN</a></li>
        <li class="navsToHide" style="float:right"><a href="#" onclick="scrollTo('contact')">CONTACT</a></li>
        <li class="navsToHide" style="float:right"><a href="#" onclick="scrollTo('benefits')">BENEFITS</a></li>
        <li class="navsToHide" style="float:right"><a href="#" onclick="scrollTo('services')">FEATURES</a></li>
        <li class="navsToHide" style="float:right"><a href="#" onclick="scrollTo('about')">ABOUT</a></li>
        <li class="navsToHide" style="float:right"><a href="#" onclick="scrollTo('top')">HOME</a></li>
        <!--<li class="navsToHide" style="float:right"><a href="#" onclick="modal('employeeInfoModal', true, '0.7s'); checkDays()">TEST</a></li>-->
    </ul>

    <div style="float:right" class="responsiveIcon"><a href="#" onclick="responsiveIcon()">☰</a></div>

    <div class="responsiveNav" style="z-index: 11">
        <ul class="nav-small">
            <li><a href="#" onclick="scrollTo('top')">HOME</a></li>
            <li><a href="#" onclick="scrollTo('about')">ABOUT</a></li>
            <li><a href="#" onclick="scrollTo('services')">FEATURES</a></li>
            <li><a href="#" onclick="scrollTo('benefits')">BENEFITS</a></li>
            <li><a href="#" onclick="scrollTo('contact')">CONTACT</a></li>
            <!--<li><a href="#" onclick="modal('loginModal', true, '0.7s')">LOGIN</a></li>
            <li><a href="#about" onclick="modal('signupModal', true, '0.7s')">SIGN UP</a></li>-->
            <li><a href="login.aspx">LOGIN</a></li>
            <li><a href="register.aspx">SIGN UP</a></li>
        </ul>
    </div>




    <div class="moveAll">

        <div class="home">
            <div id="laptop"></div>
            <div class="text">
                <h2>Farmer Management Solutions</h2>
                <p>Kiwihort helps to simplify and streamline the worker management process for Kiwifruit orchard owners, contractors and workers.</p>
                <button class="getStarted" onclick="modal('signupModal', true, '0.7s')"><p>Get started</p></button>
            </div>
        </div>
        <div class="about">
            <div class="sectionTop">
                <h2>What is Kiwihort?</h2>
                <hr class="line1">
                <p>Kiwihort is a web-based orchard management tool, designed to help strengthen the link between Kiwifruit orchard owners, contractors, managers, and workers. Read on below to see exactly what features Kiwihort is boasting.</p>
            </div>
        </div>
        <div class="services">
            <div class="servicesTop">
                <h2>Features</h2>
                <hr class="line2"/>
            </div>
            <div class="quadServices">

                <div class="service">
                    <img src="img/icon1.png" class="serviceImage" alt=""/>
                    <h3>Workforce</h3>
                    <p>Never lose sight of your workers with Kiwihort’s simple workforce management section.</p>
                </div>
                <div class="service">
                    <img src="img/icon2.png" class="serviceImage" alt=""/>
                    <h3>Organising</h3>
                    <p>Easily manage the days your workers will be required to work with the intuitive workforce organiser.</p>
                </div>
                <div class="service">
                    <img src="img/icon3.png" class="serviceImage" alt=""/>
                    <h3>Messaging</h3>
                    <p>Always stay in touch with your contacts through Kiwihort’s fully integrated internal messaging system.</p>
                </div>
                <div class="service">
                    <img src="img/icon8.png" class="serviceImage" alt=""/>
                    <h3>Weather</h3>
                    <p>Kiwihort’s weather monitoring system allows you to track the forecast, and more easily allocate work accordingly.</p>
                </div>
            </div>
            <div class="servicesTop">
                <h2>Coming Soon...</h2>
                <hr class="line2"/>
            </div>
            <div class="quadServices">
                <div class="service">
                    <img src="img/icon5.png" class="serviceImage" alt=""/>
                    <h3>Documents</h3>
                    <p>Kiwihort offers 1 Gigabyte of safe and secure cloud storage space for all your most important documents.</p>
                </div>
                <div class="service">
                    <img src="img/icon6.png" class="serviceImage" alt=""/>
                    <h3>Authentication</h3>
                    <p>Keep track of your workers, and ensure they are always on time with onsite image and fingerprint authentication systems.</p>
                </div>
                <div class="service">
                    <img src="img/icon7.png" class="serviceImage" alt=""/>
                    <h3>Payroll</h3>
                    <p>Kiwihort will be capable of offering a place for you to check and manage your payroll systems.</p>
                </div>
                <div class="service">
                    <img src="img/icon4.png" class="serviceImage" alt=""/>
                    <h3>Statistics</h3>
                    <p>Track sales, expenses and capital investments and allocate them to each crop production.</p>
                </div>
            </div>
        </div>
        <div class="benefitGrad"></div>
        <div class="benefitsTop">
            <h2>Benefits</h2>
            <hr class="line2"/>
        </div>
        <div class="benefits">
            <div class="benefitColumn">
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Avoiding legal issues – assurance of legal compliance</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Providing information to farmers (Training Tool)</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Access to pre-screened quality workforce</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Global G.A.P order compliance</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Tax compliance</p>
                </div>
            </div>
            <div class="benefitColumn">
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Assurance for migrant and legal workers for fair pay</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Health and Safety – Facilitate drug testing</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Faster than paper – Digital Platform</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Clear communication</p>
                </div>
                <div class="singleBenefit">
                    <img src="img/tickIcon.png" class="tickIcon"/>
                    <p>Stability/Transparency</p>
                </div>
            </div>
        </div>
        <div class="contact" id="theContact">

            <div class="sectionTop">
                <h2>Contact Us</h2>
                <hr class="line1"/>
                <p>Send us a message! Let us know what you think of us or just get in contact.</p>
            </div>
            <form id="frm" runat="server" class="form">
            
                <asp:TextBox ID="txtname" runat="server" class="contact-name" type="text" placeholder="Name"></asp:TextBox>
                <asp:TextBox ID="txtemail" runat="server" class="contact-email" type="email" placeholder="Email" TextMode="Email"></asp:TextBox>
                <asp:TextBox ID="TextBox1" runat="server" class="contact-message" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Submit" class="contact-submit" OnClick="Button1_Click"/>
             
                </form>
        </div>
    </div>
</body>
</html>
