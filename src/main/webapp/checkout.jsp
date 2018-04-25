<%-- 
    Document   : checkout
    Created on : Mar 4, 2018, 5:23:22 PM
    Author     : Rania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="displayCartProductsServletApp"></jsp:include>
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
<%--<jsp:include page="buyServletApp"></jsp:include>--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Luxury Watches A Ecommerce Category Flat Bootstarp Resposive Website Template | Checkout :: w3layouts</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
                console.log(email + "###" + psw);
                //                req.send(null);
                req.send("email=" + email + "&psw=" + psw);
            }
            function confirmLoginReq() {
                if (req.readyState == 4)
                    if (req.status == 200) {
                        header = document.getElementById("top-header");
                        console.log(req.responseText);
                        response = req.responseText;
                        if (response === "user")
                            location.reload();
                        else
                            location.assign("adminjsp/index.html");
                    } else
                        window.alert("you may have problem with your connection");
            }
            var secondReq = null;
            var removedItem = null;
            function removeReq(cartItemId) {
                if (window.XMLHttpRequest)
                    secondReq = new XMLHttpRequest();
                else if (window.ActiveXObject)
                    secondReq = new ActiveXObject(Microsoft.XMLHTTP);
                console.log(cartItemId);
                removedItem = cartItemId;
                url = "removeFromCartServletApp?" + "cartItemIdToRemove=" + cartItemId + "&timeStamp=" + new Date().getTime();
                secondReq.open("GET", url, true);
                secondReq.onreadystatechange = confirmRemoveReq;
                secondReq.send(null);
            }
            function confirmRemoveReq() {
                if (secondReq.readyState == 4)
                    if (secondReq.status == 200) {
                        console.log("second req");
                        console.log(secondReq.responseText);
                        response2 = secondReq.responseText;
                        if (response2 == "done")
                            $('#' + removedItem).fadeOut('slow', function(c) {
                                $('#' + removedItem).remove();
                            });
                    } else
                        window.alert("your item has't been removed");
            }
            var thirdReq = null;
            var productId = null;

            function buyReq(prodId, prodQuantity, prodPrice) {
                if (window.XMLHttpRequest)
                    thirdReq = new XMLHttpRequest();
                else if (window.ActiveXObject)
                    thirdReq = new ActiveXObject(Microsoft.XMLHTTP);
                productId = prodId;
                url = "buyServletApp?" + "prodId=" + prodId + "&prodQuantity=" + prodQuantity + "&prodPrice=" +
                        prodPrice + "&timeStamp=" + new Date().getTime();
                thirdReq.open("GET", url, true);
                thirdReq.onreadystatechange = confirmBuyReq;
                thirdReq.send(null);
            }
            function confirmBuyReq() {
                if (thirdReq.readyState == 4)
                    if (thirdReq.status == 200) {
                        console.log("buy req");
                        console.log(thirdReq.responseText);
                        response3 = thirdReq.responseText;
                        if (response3 == "valid") {
                            $('#validBuyModal').modal({
                                show: 'true'
                            });
                            $('#' + productId).fadeOut('slow', function(c) {
                                $('#' + productId).remove();
                            });
                        }
                        else if (response3 == "invalid")
                            $('#myModal').modal({
                                show: 'true'
                            });
                    } else
                        window.alert("buying confirmation");
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
                        <li class="active">Checkout</li>
                    </ol>
                </div>
            </div>
        </div>
        <!--end-breadcrumbs-->

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Warning</h4>
                    </div>
                    <div class="modal-body">
                        <p>sorry, you don't have enough balance.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="validBuyModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Paying Process</h4>
                    </div>
                    <div class="modal-body">
                        <p>Successfully Paid.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--start-ckeckout-->
        <div class="ckeckout">
            <div class="container">
                <div class="ckeck-top heading">
                    <h2>CHECKOUT</h2>
                </div>
                <div class="ckeckout-top">
                    <div class="cart-items">
                        <h3>My Shopping Bag</h3>
                        <script>
                            var url = "";
                            function setBuyingParams(prodId, prodQuantity, prodPrice) {
                                url = "checkout.jsp?prodId=" + prodId + "&prodQuantity=" + prodQuantity + "&prodPrice=" + prodPrice;
                                $('#' + prodId).fadeOut('slow', function(c) {
                                    $('#' + prodId).remove();
                                });
                                window.location.href = url;

                            }
                        </script>

                        <div class="in-check" >
                            <ul class="unit">
                                <li><span>Item</span></li>
                                <li><span>Product Name</span></li>		
                                <li><span>Unit Price</span></li>
                                <li><span>Quantity</span></li>

                                <div class="clearfix"> </div>
                            </ul>
                            <c:forEach items="${sessionScope.cartProducts}" var="cartProduct">
                                <ul class="cart-header" id="${cartProduct.id}">
                                    <div class="close1" onclick="removeReq(${cartProduct.id});"> </div>
                                    <li class="ring-in">
                                        <a href="single.jsp?id=<c:out value='${cartProduct.id}'/>">
                                            <img class="img-responsive" 
                                                 src="<c:out value="${cartProduct.imageName}"/>" alt="">
                                        </a>
                                    </li>
                                    <li><span class="name"><c:out value="${cartProduct.productName}"/></span></li>
                                    <li><span class="cost"><c:out value="${cartProduct.productPrice}"/></span></li>
                                    <li><span class="cost"><c:out value="${cartProduct.productQuantity}"/></span></li>
                                    <li>
                                        <input style="margin-top:30px; background-color: #33adff;
                                               color:#fff; border-radius:5px;"
                                               type="button" value="Buy" id="buyProd" 
                                               onclick="buyReq(${cartProduct.id},${cartProduct.productQuantity},
                                               ${cartProduct.productPrice});">
                                    </li>

                                    <div class="clearfix"> </div>
                                </ul>  
                            </c:forEach>
                        </div>

                    </div>  
                </div>
            </div>
        </div>
        <!--end-ckeckout-->
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
                            <input type="text" value="Enter Your Email" onfocus="this.value = '';"
                                   onblur="if (this.value == '') {
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