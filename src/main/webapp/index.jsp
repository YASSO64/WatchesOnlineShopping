
<%-- 
    Document   : index
    Created on : Mar 4, 2018, 5:26:29 PM
    Author     : Rania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="myProductServletApp"></jsp:include>
<%--<jsp:include page="addToCartServletApp"></jsp:include>--%>

    <!DOCTYPE html>
    <html>
        <head>
            <title>Luxury Watches A Ecommerce Category Flat Bootstrap Resposive Website Template | Home :: w3layouts</title>
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
                            else if (response === "admin")
                                location.assign("adminjsp/index.jsp");
                        } else
                            window.alert("you may have problem with your connection");
                }

                var thirdReq = null;
                function addToCartReq(productId, productPrice) {
                    if (window.XMLHttpRequest)
                        thirdReq = new XMLHttpRequest();
                    else if (window.ActiveXObject)
                        thirdReq = new ActiveXObject(Microsoft.XMLHTTP);

                    add_to_cart_url = "addToCartServletApp?" + "cartProdId=" + productId + "&cartProdQuantity=" + selectedValue +
                            "&cartProdPrice=" + productPrice + "&timeStamp=" + new Date().getTime();
                    thirdReq.open("GET", add_to_cart_url, true);
                    thirdReq.onreadystatechange = confirmAddingReq;
                    thirdReq.send(null);
                }
                function confirmAddingReq() {
                    if (thirdReq.readyState == 4)
                        if (thirdReq.status == 200) {
                            console.log("add to cart req");
                            console.log(thirdReq.responseText);
                            response3 = thirdReq.responseText;
                            if (response3 == "done") {
                                $('#addedToCartModal').modal({
                                    show: 'true'
                                });
                            }

                        } else
                            window.alert("connection error");
                }

                function openNav() {
                    document.getElementById("myNav").style.height = "100%";
                }

                function closeNav() {
                    document.getElementById("myNav").style.height = "0%";
                }
            </script>
            <script>
                var selectedValue = "";
                var url = "";
                $(document).ready(function () {
                    $(".memenu").memenu();
                    $("select").change(function () {
                        selectedValue = $(this).val();
                    });
                });

                function setProdIdAndPrice(productId, productPrice) {
                    url = "?cartProdId=" + productId + "&cartProdQuantity=" + selectedValue + "&cartProdPrice=" + productPrice;
                    window.location.href = url;
                }
            </script>	
            <!--dropdown-->
            <script src="js/jquery.easydropdown.js"></script>			
        </head>

        <body>
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
                            <ul class="memenu skyblue">
                                <li class="active">
                                    <a href="index.jsp">Home</a>
                                </li>
                                <li class="grid"><a href="products.jsp?category=Men">Men</a>
                                </li>
                                <li class="grid"><a href="products.jsp?category=Women">Women</a>
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


        <div class="modal fade" id="addedToCartModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adding To Cart</h4>
                    </div>
                    <div class="modal-body">
                        <p>The Product has been Added to cart successfully.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

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
                                           $(function () {
                                               // Slideshow 4
                                               $("#slider4").responsiveSlides({
                                                   auto: true,
                                                   pager: true,
                                                   nav: true,
                                                   speed: 500,
                                                   namespace: "callbacks",
                                                   before: function () {
                                                       $('.events').append("<li>before event fired.</li>");
                                                   },
                                                   after: function () {
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
                                    <div class="product-main simpleCart_shelfItem" width="300px" height="300px">
                                        <a href="single.jsp?id=<c:out value='${product.id}'/>" class="mask">
                                            <img class="img-responsive zoom-img" width="150px" height="150px"
                                                 src="<c:out value="${product.imageName}"/>"alt="" />
                                        </a>
                                        <div class="product-bottom">
                                            <h3><c:out value="${product.productName}"/></h3>
                                            <p><c:out value="${product.product_brand}"/></p>
                                            <div>
                                                <h5>
                                                    <c:if test="${sessionScope.user.user_name != null && sessionScope.user.user_name != ''}">
                                                    <select id="quantityDropList">
                                                        <option disabled selected value> -- select quantity -- </option>
                                                        <c:forEach var="i" begin="1" end="${product.productQuantity}">
                                                            <option value="${i}">
                                                                ${i}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    </c:if>
                                                </h5>
                                            </div>
                                            <h4>
                                                <c:if test="${sessionScope.user.user_name != null && sessionScope.user.user_name != ''}">
                                                <a onclick="addToCartReq(${product.id},${product.productPrice});"
                                                   class="item_add">
                                                    <i></i>
                                                </a> 
                                                </c:if>
                                                <span class=" item_price">
                                                    <c:out value="${product.productPrice}$"/>
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
                                                    <img class="img-responsive zoom-img" width="150px" height="150px"
                                                         src="<c:out value='${searchedResult.imageName}'/>"alt="" />
                                                </a>
                                                <div class="product-bottom">
                                                    <h3><c:out value="${searchedResult.productName}"/></h3>
                                                    <p><c:out value="${searchedResult.product_brand}"/></p>


                                                    <div>
                                                        <h5>
                                                            <c:if test="${sessionScope.user.user_name != null && sessionScope.user.user_name != ''}">
                                                            <select id="quantityDropList">
                                                                <option disabled selected value> -- select quantity -- </option>
                                                                <c:forEach var="i" begin="1" end="${searchedResult.productQuantity}">
                                                                    <option value="${i}">
                                                                        ${i}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                            </c:if>
                                                        </h5>
                                                    </div>
                                                    <h4>
                                                        <c:if test="${sessionScope.user.user_name != null && sessionScope.user.user_name != ''}">
                                                        <a onclick="addToCartReq(${searchedResult.id},${searchedResult.productPrice});"
                                                           class="item_add">
                                                            <i></i>
                                                        </a>
                                                        </c:if>
                                                        <span class="item_price">
                                                            <c:out value="${searchedResult.productPrice}$"/>
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