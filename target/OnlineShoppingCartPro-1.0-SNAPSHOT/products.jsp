<%-- 
    Document   : products
    Created on : Mar 4, 2018, 5:28:19 PM
    Author     : Rania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="productSearchServletApp"></jsp:include>

    <!DOCTYPE html>
    <html>
        <head>
            <title>Luxury Watches A Ecommerce Category Flat Bootstarp Resposive Website Template | Product :: w3layouts</title>
            <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
            <!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
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
            <!--dropdown-->
            <script src="js/jquery.easydropdown.js"></script>			
        </head>
        <body> 
            <!--top-header-->
            <div class="top-header">
                <div class="container">
                    <div class="top-header-main">
                        <div class="col-md-6 top-header-left">
                            <div class="drop">
                                <div class="box">
                                    <select tabindex="4" class="dropdown drop">
                                        <option value="" class="label">Dollar :</option>
                                        <option value="1">Dollar</option>
                                        <option value="2">Euro</option>
                                    </select>
                                </div>
                                <div class="box1">
                                    <select tabindex="4" class="dropdown">
                                        <option value="" class="label">English :</option>
                                        <option value="1">English</option>
                                        <option value="2">French</option>
                                        <option value="3">German</option>
                                    </select>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-md-6 top-header-left">
                            <div class="cart box_1">
                                <a href="checkout.jsp">
                                    <div class="total">
                                        <span class="simpleCart_total"></span></div>
                                    <img src="images/cart-1.png" alt="" />
                                </a>
                                <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
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
                                    <li class="grid"><a href="account.jsp">Login</a>
                                    </li>
                                    <li class="grid"><a href="Signup.jsp">SignUp</a>
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
                            <li class="active">New Products</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!--end-breadcrumbs-->
            <!--prdt-starts-->
            <div class="prdt"> 
                <div class="container">
                    <div class="prdt-top">
                        <div class="col-md-9 prdt-left">

                        <c:forEach items="${requestScope.prodsByCategory}" var="product">
                            <div class="product-one">
                                <div class="col-md-4 product-left p-left">
                                    <div class="product-main simpleCart_shelfItem">
                                        <a href="single.jsp?id=<c:out value='${product.id}'/>" class="mask">
                                            <img class="img-responsive zoom-img" src="<c:out value="${product.imageName}"/>" alt="" />
                                        </a>
                                        <div class="product-bottom">
                                            <h3><c:out value="${product.productName}"/></h3>
                                            <p><c:out value="${product.product_brand}"/></p>
                                            <h4><a class="item_add" href="#"><i></i></a> 
                                                <span class=" item_price">
                                                    <c:out value="${product.productPrice}"/>
                                                </span>
                                            </h4>
                                        </div>
                                        <div class="srch srch1">
                                            <span>-50%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>	
                        </c:forEach>

                        <div class="clearfix"></div>

                    </div>	
                    <div class="col-md-3 prdt-right">
                        <div class="w_sidebar">

                            <section  class="sky-form">
                                <h4>Brand</h4>
                                <div class="row1 row2 scroll-pane">
                                   
                                    <div class="col col-4">
                                        <c:forEach items="${requestScope.brands}" var="brand">
                                            <label class="checkbox">
                                                <input type="checkbox" name="checkbox" value="${brand}"/> <i></i>
                                                <c:out value="${brand}"/>
                                            </label>
                                        </c:forEach>									
                                    </div>
                                </div>
                            </section>

                            <section class="sky-form">
                                <h4>discount</h4>
                                <div class="row1 row2 scroll-pane">
                                    <div class="col col-4">
                                        <label class="radio"><input type="radio" name="radio" checked=""><i></i>60 % and above</label>
                                        <label class="radio"><input type="radio" name="radio"><i></i>50 % and above</label>
                                        <label class="radio"><input type="radio" name="radio"><i></i>40 % and above</label>
                                    </div>
                                    <div class="col col-4">
                                        <label class="radio"><input type="radio" name="radio"><i></i>30 % and above</label>
                                        <label class="radio"><input type="radio" name="radio"><i></i>20 % and above</label>
                                        <label class="radio"><input type="radio" name="radio"><i></i>10 % and above</label>
                                    </div>
                                </div>						
                            </section>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--product-end-->
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