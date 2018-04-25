<%-- 
    Document   : top-header
    Created on : Mar 11, 2018, 3:55:38 AM
    Author     : Shemo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<div class="top-header-main">
    <div class="col-md-6 top-header-left">
        <div class="login-link">
            <c:if test="${empty sessionScope.user}">
                <a href="#" onclick="openNav()">Login</a>
                <a href="Signup.jsp" onclick="">Register </a>
            </c:if>
            <c:if test="${sessionScope.user.user_name != null && sessionScope.user.user_name != ''}">
                 <!--<a><c:out value="${sessionScope.user.user_name}" /></a>-->
                 <div class="top-nav">
                            <ul class="memenu skyblue">
                                <li class="grid" style="color : #fff;"><img src="${sessionScope.user.profile_pic}" class="user-profile">
                                    <c:out value="${sessionScope.user.user_name}" />
                                    <div class="mepanel" style="width:40%;">
                                        <div class="row">
                                            <div class="col1 me-one" style="width:90%;">
                                                <div class="profile-a">
                                                <ul>
                                                    <li><a href="user-profile.jsp">Profile</a></li>
                                                    <li><a href="UpdateUserProfile.jsp">Edit Profile</a></li>
                                                    <li><a href="ChargeCart.jsp">Charge Card</a></li>
                                                    <li><a href="Logout">Logout</a></li>
                                                </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                </div>
            </c:if>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="col-md-6 top-header-left">
        <div class="cart box_1">
            <c:if test="${sessionScope.user.user_name != null && sessionScope.user.user_name != ''}">
            <a href="checkout.jsp">
<!--                <div class="total">
                    <span class="simpleCart_total"></span></div>-->
                <img src="images/cart-1.png" alt="" />
            </a>
            <p><span style="color: #fff;">Check your cart</span></p>
            </c:if>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
