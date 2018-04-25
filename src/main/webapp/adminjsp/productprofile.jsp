<%-- 
    Document   : viewProduct
    Created on : Mar 14, 2018, 1:30:30 PM
    Author     : Rania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Product Profile  </title>

    <!-- Bootstrap -->
    <link href="/OnlineShoppingCartPro/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/OnlineShoppingCartPro/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/OnlineShoppingCartPro/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="/OnlineShoppingCartPro/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="/OnlineShoppingCartPro/build/css/custom.min.css" rel="stylesheet">
  </head>

 
  
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i> <span>${sessionScope.user.user_name}</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="${sessionScope.user.profile_pic}" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${sessionScope.user.user_name}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.jsp">Dashboard</a></li>
                   
                    </ul>
                  </li>
                 
                </ul>
              
              </div>
              <div class="menu_section">
              
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Products  <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/OnlineShoppingCartPro/AllProdctSer">All Products </a></li>
                      <li><a href="AddNewProductForm.jsp">Add Product</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i>  View Users <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                       <li><a href ="/OnlineShoppingCartPro/GetAllusersView">view user</a></li>
                      
                    </ul>
                  </li>
                 
                                        
                  
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="/OnlineShoppingCartPro/Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3> Product Details</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Product Report <small>Activity report</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" src="${requestScope.product.imageName}" alt="Avatar" title="Change the avatar">
                        </div>
                      </div>
                      <h3>${requestScope.product.productName}</h3>

                      <ul class="list-unstyled user_data">
                          
                          <li><i class="fa fa-briefcase user-profile-icon"></i> ${requestScope.product.productCategory}
                        </li>

                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i> ${requestScope.product.product_brand}
                        </li>
                        
                         <li>
                          <i class="fa fa-briefcase user-profile-icon"></i> $ ${requestScope.product.productPrice} 
                        </li>
                         <li>
                             <i class="fa fa-briefcase user-profile-icon"></i> ${requestScope.product.productQuantity}
                        </li>

                      
                      </ul>

                     

                      <!-- start skills -->
                     
                      
                      <!-- end of skills -->

                    </div>
                    

                      
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            <p>LUXURY WATCHES</p>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/OnlineShoppingCartPro/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/OnlineShoppingCartPro/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/OnlineShoppingCartPro/vendors/nprogress/nprogress.js"></script>
    <!-- morris.js -->
    <script src="/OnlineShoppingCartPro/vendors/raphael/raphael.min.js"></script>
    <script src="/OnlineShoppingCartPro/vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/OnlineShoppingCartPro/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/OnlineShoppingCartPro/vendors/moment/min/moment.min.js"></script>
    <script src="/OnlineShoppingCartPro/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="/OnlineShoppingCartPro/build/js/custom.min.js"></script>

  </body>
</html>

