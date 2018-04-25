<%-- 
    Document   : loginjsp
    Created on : Mar 17, 2018, 6:22:01 AM
    Author     : Shemo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="account">
		<div class="container">
		<div class="account-top heading">
				<h2>ACCOUNT</h2>
			</div>
			<div class="account-main">
				<div class="col-md-6 account-left">
					<h3>Existing User</h3>
					<div class="account-bottom">
                                            <form>
						<input id="email" placeholder="Email" type="text" tabindex="4" required>
						<input id="password" placeholder="Password" type="password" tabindex="4" required>
						<div class="address">
                                                    <input type="button" value="Login" onclick="loginReq()">
					
						</div>
                                                </form>
					</div>
				</div>
				<div class="col-md-6 account-right account-left">
					<h3>New User? Create an Account</h3>
					<p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
					<a href="Signup.jsp">Create an Account</a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
