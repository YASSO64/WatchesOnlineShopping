<%-- 
    Document   : account
    Created on : Mar 4, 2018, 5:21:30 PM
    Author     : Rania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="myProductServletApp"></jsp:include>

<!DOCTYPE html>
<html>
    <head>
        <title>Luxury Watches A Ecommerce Category Flat Bootstarp Resposive Website Template | Account :: w3layouts</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
        <script src="js/jquery-1.11.0.min.js"></script>
        <!--Custom-Theme-files-->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/jsp; charset=utf-8" />
        <meta name="keywords" content="Luxury Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--start-menu-->
        <script src="js/simpleCart.min.js"></script>
        <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/memenu.js"></script>
        <script>$(document).ready(function() {
    $(".memenu").memenu();
});</script>	
        <script>
            var req = null;
            function loginReq() {
                if (window.XMLHttpRequest)
                    req = new XMLHttpRequest();
                else if (window.ActiveXObject)
                    req = new ActiveXObject(Microsoft.XMLHTTP);
                email = document.getElementById("email").value;
                psw = document.getElementById("password").value;
                url = "Login?timeStamp=" + new Date().getTime();
                req.open("POST", url, true);
                req.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                req.onreadystatechange = confirmLoginReq;
                console.log(email+"###"+psw);
//                req.send(null);
                req.send("email=" + email + "&psw=" + psw);
            }
            function confirmLoginReq() {
                if (req.readyState == 4)
                    if (req.status == 200) {
                        header = document.getElementById("top-header");
                        console.log(req.responseText);
                        response = req.responseText;
                        if(response === "user")
                            location.reload();
                        else
                            location.assign("adminjsp/index.html");
                    } else
                        window.alert("you may have problem with your connection");
            }
            function openNav() {
                document.getElementById("myNav").style.height = "100%";
            }

            function closeNav() {
                document.getElementById("myNav").style.height = "0%";
            }
        </script>
        <!--dropdown-->
        <script src="js/jquery.easydropdown.js"></script>			
    </head>
    <body> 
        <!--top-header-->
           <!--top-header-->
        <div id="myNav" class="overlay">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
             <c:import url="loginjsp.jsp"/>
        </div>

        <div class="top-header" id="top-header">
            <div class="container">
             <c:import url="top-header.jsp"/>
            </div>
        </div>
        <!--top-header-->
        <!--start-logo-->
        <div class="logo">
            <a href="index.jsp"><h1>Luxury Watches</h1></a>
        </div>
        <!--start-logo-->
        <!--bottom-header-->
        <div class="header-bottom">
            <div class="container">
                <div class="header">
                    <div class="col-md-9 header-left">
                        <div class="top-nav">
                            <ul class="memenu skyblue"><li class="active"><a href="index.jsp">Home</a></li>
                                <li class="grid"><a href="products.jsp?category=Men">Men</a>
                                </li>
                                <li class="grid"><a href="products.jsp?category=Women">Women</a>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--bottom-header-->
        <!--start-breadcrumbs-->
        <div class="breadcrumbs">
            <div class="container">
                <div class="breadcrumbs-main">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Login</li>
                    </ol>
                </div>
            </div>
        </div>
        <!--end-breadcrumbs-->
        <!--account-starts-->
        <div class="account">
            <div class="container">
                <div class="account-top heading">
                    <h2>ACCOUNT</h2>
                </div>
                <div class="account-main">
                    <div class="col-md-6 account-left">
                        <h3>Existing User</h3>
                        <div class="account-bottom">
                            <input placeholder="Email" type="text" tabindex="3" required>
                            <input placeholder="Password" type="password" tabindex="4" required>
                            <div class="address">
                                <input type="submit" value="Login">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 account-right account-left">
                        <h3>New User? Create an Account</h3>
                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                        <a href="register.jsp">Create an Account</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--account-end-->
        <!--information-starts-->
        <div class="information">
            <div class="container">
                <div class="infor-top">
                    <div class="col-md-3 infor-left">
                        <h3>Follow Us</h3>
                        <ul>
                            <li><a href="#"><span class="fb"></span><h6>Facebook</h6></a></li>
                            <li><a href="#"><span class="twit"></span><h6>Twitter</h6></a></li>
                            <li><a href="#"><span class="google"></span><h6>Google+</h6></a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 infor-left">
                        <h3>Information</h3>
                        <ul>
                            <li><a href="#"><p>Specials</p></a></li>
                            <li><a href="#"><p>New Products</p></a></li>
                            <li><a href="#"><p>Our Stores</p></a></li>
                            <li><a href="contact.jsp"><p>Contact Us</p></a></li>
                            <li><a href="#"><p>Top Sellers</p></a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 infor-left">
                        <h3>My Account</h3>
                        <ul>
                            <li><a href="account.jsp"><p>My Account</p></a></li>
                            <li><a href="#"><p>My Credit slips</p></a></li>
                            <li><a href="#"><p>My Merchandise returns</p></a></li>
                            <li><a href="#"><p>My Personal info</p></a></li>
                            <li><a href="#"><p>My Addresses</p></a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 infor-left">
                        <h3>Store Information</h3>
                        <h4>The company name,
                            <span>Lorem ipsum dolor,</span>
                            Glasglow Dr 40 Fe 72.</h4>
                        <h5>+955 123 4567</h5>	
                        <p><a href="mailto:example@email.com">contact@example.com</a></p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--information-end-->
        <!--footer-starts-->
        <div class="footer">
            <div class="container">
                <div class="footer-top">
                    <div class="col-md-6 footer-left">
                        <form>
                            <input type="text" value="Enter Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                            this.value = 'Enter Your Email';
                                                        }">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                    <div class="col-md-6 footer-right">					
                        <p>© 2015 Luxury Watches. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--footer-end-->	
    </body>
</html>
