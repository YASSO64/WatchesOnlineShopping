<%-- 
    Document   : usersview
    Created on : Mar 12, 2018, 10:26:53 PM
    Author     : Rania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Users View </title>

    <!-- Bootstrap -->
    <link href="/OnlineShoppingCartPro/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/OnlineShoppingCartPro/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/OnlineShoppingCartPro/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/OnlineShoppingCartPro/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/OnlineShoppingCartPro/build/css/custom.min.css" rel="stylesheet">
  </head>

  
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Admin Name</span></a>
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
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
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
                <h3>All Users <small>Listing design</small></h3>
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
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Users</h2>
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

                    

                    <!-- start project list -->
                    <table class="table table-striped projects">
                      <thead>
                        <tr>
                         
                          <th style="width: 20%">User Name</th>
                          
                          <th>User's profile Progress</th>
                          <th>Status</th>
                          <th style="width: 20%">View User Profile</th>
                        </tr>
                      </thead>
                      <tbody>
                      
                        <c:if test="${requestScope.userslist!= null}"> 
	                 <c:forEach items="${requestScope.userslist}" var="elementuser"> 
                              <tr>
                          
                          <td>
                            ${elementuser.user_name}
                          </td>
                         
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
                            </div>
                            <small>100% Complete</small>
                          </td>
                          <td>
                            <button type="button" class="btn btn-success btn-xs">Success</button>
                          </td>
                          <td>
                              
                            <a href="UserProfileServ?userid=${elementuser.id}" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                            
                          </td>
                        </tr>
                        </c:forEach>
                         
                           
                            
                          
                        
	
	   </c:if>
 
                        
                        
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>