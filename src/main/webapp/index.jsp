<%-- 
    Document   : index
    Created on : Mar 4, 2018, 5:26:29 PM
    Author     : Rania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="myProductServletApp"></jsp:include>
<jsp:include page="cartManipulationServletApp"></jsp:include>

    <!DOCTYPE html>
    <html>
        <head>
            <title>Luxury Watches A Ecommerce Category Flat Bootstrap Resposive Website Template | Home :: w3layouts</title>
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
            <script> 
                var selectedValue = "";
                $(document).ready(function() {
                    $(".memenu").memenu();
                    $("select").change(function() {
                       // alert($(this).val());
                        selectedValue = $(this).val();
                    });
                });
                
                function setProdIdAndPrice(productId, productPrice) {
                        var url = "?cartProdId=" + productId + "&cartProdQuantity=" + selectedValue +
                                "&cartProdPrice=" + productPrice;
                        window.location.href = url;
                    }
            </script>	
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
                                <ul class="memenu skyblue">
                                    <li class="active">
                                        <a href="index.jsp">Home</a>
                                    </li>
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
                        <div class="col-md-3 header-right"> 
                            <div class="search-bar">
                                <form id="my_form">
                                    <input type="text" name="searchedInput" placeholder="Search" onfocus="this.value = '';"
                                           onblur="if (this.value == '') {
                                                       this.value = 'Search';
                                                   }">
                                    <input type="submit" value="">
                                </form>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <!--bottom-header-->
            <!--banner-starts-->
            <div class="bnr" id="home">
                <div  id="top" class="callbacks_container">
                    <ul class="rslides" id="slider4">
                        <li>
                            <img src="images/bnr-1.jpg" alt=""/>
                        </li>
                        <li>
                            <img src="images/bnr-2.jpg" alt=""/>
                        </li>
                        <li>
                            <img src="images/bnr-3.jpg" alt=""/>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
            <!--banner-ends--> 
            <!--Slider-Starts-Here-->
            <script src="js/responsiveslides.min.js"></script>
            <script>
                                               // You can also use "$(window).load(function() {"
                                               $(function() {
                                                   // Slideshow 4
                                                   $("#slider4").responsiveSlides({
                                                       auto: true,
                                                       pager: true,
                                                       nav: true,
                                                       speed: 500,
                                                       namespace: "callbacks",
                                                       before: function() {
                                                           $('.events').append("<li>before event fired.</li>");
                                                       },
                                                       after: function() {
                                                           $('.events').append("<li>after event fired.</li>");
                                                       }
                                                   });

                                               });
            </script>
            <!--End-slider-script-->
            <!--about-starts-->
            <div class="about"> 
                <div class="container">
                    <div class="about-top grid-1">
                        <div class="col-md-4 about-left">
                            <figure class="effect-bubba">
                                <img class="img-responsive" src="images/abt-1.jpg" alt=""/>
                                <figcaption>
                                    <h2>Nulla maximus nunc</h2>
                                    <p>In sit amet sapien eros Integer dolore magna aliqua</p>	
                                </figcaption>			
                            </figure>
                        </div>
                        <div class="col-md-4 about-left">
                            <figure class="effect-bubba">
                                <img class="img-responsive" src="images/abt-2.jpg" alt=""/>
                                <figcaption>
                                    <h4>Mauris erat augue</h4>
                                    <p>In sit amet sapien eros Integer dolore magna aliqua</p>	
                                </figcaption>			
                            </figure>
                        </div>
                        <div class="col-md-4 about-left">
                            <figure class="effect-bubba">
                                <img class="img-responsive" src="images/abt-3.jpg" alt=""/>
                                <figcaption>
                                    <h4>Cras elit mauris</h4>
                                    <p>In sit amet sapien eros Integer dolore magna aliqua</p>	
                                </figcaption>			
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!--about-end-->
            <!--product-starts-->

            <div class="product"> 
                <div class="container">
                    <div class="product-top">

                    <c:if test="${param.searchedInput==null}">
                        <c:forEach items="${products}" var="product">
                            <div class="product-one">
                                <div class="col-md-3 product-left">
                                    <div class="product-main simpleCart_shelfItem">
                                        <a href="single.jsp?id=<c:out value='${product.id}'/>" class="mask">
                                            <img class="img-responsive zoom-img" 
                                                 src="<c:out value="${product.imageName}"/>"alt="" />
                                        </a>
                                        <div class="product-bottom">
                                            <h3><c:out value="${product.productName}"/></h3>
                                            <p><c:out value="${product.product_brand}"/></p>
                                            <div>
                                                <h5>
                                                    <select id="quantityDropList">
                                                        <option disabled selected value> -- select quantity -- </option>
                                                        <c:forEach var="i" begin="1" end="${product.productQuantity}">
                                                            <option value="${i}">
                                                                ${i}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </h5>
                                            </div>
                                            <h4>
                                                <a onclick="setProdIdAndPrice(${product.id},${product.productPrice});"
                                                   class="item_add">
                                                    <i></i>
                                                </a> 
                                                <span class=" item_price">
                                                    <c:out value="${product.productPrice}"/>
                                                </span>
                                            </h4>

                                        </div>
                                        <div class="srch">
                                            <span>-50%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${param.searchedInput!=null}"> 
                        <c:if test="${not empty param.searchedInput}">
                            <c:if test="${empty searchedProducts}" > 
                                <h4 style="margin-left: 15px; color: red;">
                                    No Products matched The Searched Keyword!
                                </h4>
                            </c:if>
                            <c:if test="${not empty searchedProducts}" > 
                                <c:forEach items="${searchedProducts}" var="searchedResult">
                                    <div class="product-one">
                                        <div class="col-md-3 product-left">
                                            <div class="product-main simpleCart_shelfItem">
                                                <a href="single.jsp?id=<c:out value='${searchedResult.id}'/>" class="mask">
                                                    <img class="img-responsive zoom-img" 
                                                         src="<c:out value='${searchedResult.imageName}'/>"alt="" />
                                                </a>
                                                <div class="product-bottom">
                                                    <h3><c:out value="${searchedResult.productName}"/></h3>
                                                    <p><c:out value="${searchedResult.product_brand}"/></p>


                                                    <div>
                                                        <h5>
                                                            Select Quantity:
                                                            <select id="quantityDropList">
                                                                <c:forEach var="i" begin="1" 
                                                                           end="${searchedResult.productQuantity}">
                                                                    <option value="${i}">
                                                                        ${i}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </h5>
                                                    </div>
                                                    <h4>
                                                        <a href="?cartProdId=<c:out value='${searchedResult.id}'/>"
                                                           class="item_add">
                                                            <i></i>
                                                        </a>
                                                        <span class="item_price">
                                                            <c:out value="${searchedResult.productPrice}"/>
                                                        </span>
                                                    </h4>

                                                </div>
                                                <div class="srch">
                                                    <span>-50%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if> 
                        <c:if test="${empty param.searchedInput}">
                            <h4 style="margin-left: 15px; color: red;">
                                Please Enter Product Name You Search About!
                            </h4>
                        </c:if>
                    </c:if>

                    <div class="clearfix"></div>
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
                            <p>© 2015 Luxury Watches. All Rights Reserved | Design by  
                                <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!--footer-end-->	
    </body>
</html>