<%-- 
    Document   : Signup
    Created on : Mar 10, 2018, 10:21:50 PM
    Author     : Rania
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <html>
<head>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<link href="css/registractioncss.css" rel="stylesheet" type="text/css" />

<script src="js/javascriptregistration.js" type="text/javascript"></script>
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
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>	
 <script>
        function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
        </script>
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
                <p> SignUp</p>
	</div>
	
	<!--bottom-header-->
	<!--banner-starts-->



      
        <div class= "container">
	<form class="formborder" name="registration" method="post"  enctype="multipart/form-data" action="SignUp">
<div class="Containerform">

  <label><b>UserName</b></label>
 
  <input type="text" name="username" placeholder="Enter User Name"   required class="form1" id="firstn"><br>
    <div id='first' class="error"></div>
  
  <label><b> User Job</b></label>
  <input type="text" name="job" placeholder="Enter Your Job"   required class="form1" id="lastn"><br>
  <div id='last' class="error"></div>

  
  <label><b>Email    </b></label>
  <input type="text" placeholder="Enter Email" name="email" required class="form1" id="useremail"><br>
    <div id='email2' class="error"></div>
  
  <label><b>Password</b></label>
  <input type="password" placeholder="Enter Password" name="psw" required class="form1" id="userpass"><br>
    <div id='password1' class="error"></div>
    
    <label><b>Birth Date</b></label>
    <input id="date" type="date" placeholder="yy/mm/dd" class="form1" name="birthday"><br>
     <div id='birthday' class="error"></div>
  
  <label><b>Credit Limit</b></label>
  <input type="text" placeholder="Enter your Credit Limit " name="creditnumber" required class="form1" id="userpassretype"><br>
    <div id='age1' class="error"></div>
 <label><b>Address</b></label><br>
  <textarea rows="4" cols="30" name="addresss"  placeholder="Enter your Address" name ="address" class="form1" id="adress"></textarea>
   <br> <br> 
 
  
   <div style="margin-left:0px">
                          <img id="blah" src="#" alt="Choose your  image" style="margin-bottom: 30px;margin-top: 10px"/>
                          <input type='file'   onchange="readURL(this); " id="getimage" name="img"/>
                         
                      </div>
                       
  <div id='checkboxval' class="error"></div>
  
  <div class="clearfix">
     
      <button type="submit" class="signupbtn" id="login1">Sign Up</button>
	 
    </div><br>
</div>
 </form
        </div>
    </body>
</html>
