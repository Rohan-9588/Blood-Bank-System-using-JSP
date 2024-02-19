<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blood Bank System</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body style="background-image: url('images/flowing-red-blood-cells.jpg')">
        
        <%@ include file="includes/header.jsp" %>        
<!--        <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner">
    <div class="item active">
      <img src="images/5b22475cc143e.jpg" style="width:100%; height:500px">
      <div class="carousel-caption">
        <h3>Blood Donation</h3>
        <p>Donate your blood and save life</p>
      </div>
    </div>

    <div class="item">
      <img src="images/image-asset.gif" style="width:100%; height:500px">
      <div class="carousel-caption">
        <h3>Donate Blood</h3>
        <p>Donate your blood and make difference</p>
      </div>
    </div>

    <div class="item">
      <img src="images/iStock-693244582-1024x683.jpg" style="width:100%; height:500px">
      <div class="carousel-caption">
        <h3>Blood Donor day</h3>
        <p>Its nice feeling</p>
      </div>
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>-->
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br><br></div>
                    <div class="col-md-1"></div>
                    <div class="col-lg-5">
                        <div class="panel panel-default" style=" color:white;">
                            <div class="panel-body scroll" >
                                <center><label style="font-size: 20px; color:#fff ">Login Here</label></center>
                                <hr>
                                <div class="col-lg-12 text-center">
                                 <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("0"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Username/Password invalid!</div> <br><br>");
                                                        %>
                                                         <script>
                                                            $(document).ready(function () {
                                                                $('html, body').animate({
                                                                    scrollTop: $('.scroll').offset().top
                                                                }, 'slow');
                                                            });
                                                        </script>
                                                        <%
                                                    }
                                                    if(status.equals("11"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Hospital Account Verified Successfully!</div> <br><br>");
                                                        %>
                                                         <script>
                                                            $(document).ready(function () {
                                                                $('html, body').animate({
                                                                    scrollTop: $('.scroll').offset().top
                                                                }, 'slow');
                                                            });
                                                        </script>
                                                        <%
                                                    }
                                                    if(status.equals("12"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>User Account Verified Successfully!</div> <br><br>");
                                                        %>
                                                         <script>
                                                            $(document).ready(function () {
                                                                $('html, body').animate({
                                                                    scrollTop: $('.scroll').offset().top
                                                                }, 'slow');
                                                            });
                                                        </script>
                                                        <%
                                                    }
                                                    if(status.equals("22"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Password Changed Successfully!</div> <br><br>");
                                                        %>
                                                         <script>
                                                            $(document).ready(function () {
                                                                $('html, body').animate({
                                                                    scrollTop: $('.scroll').offset().top
                                                                }, 'slow');
                                                            });
                                                        </script>
                                                        <%
                                                    }
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Please select any one user type!</div> <br><br>");
%>
                                                        <script>
                                                            $(document).ready(function () {
                                                                $('html, body').animate({
                                                                    scrollTop: $('.scroll').offset().top
                                                                }, 'slow');
                                                            });
                                                        </script>
                                                        <%
                                                    }
                                                    
                             }
                    catch(Exception e){}
                                    %>
                                   
                                </div>
                                    <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="login"/>
                                <div class="form-group"> 
                                  <div class="text-center col-md-12">
                                    <div class="radio">
                                        <label class=""><input type="radio" name="usertype" value="hospital" style="height:15px; width:15px;"> <b>Hospital</b></label>
                                        <label class="col-sm-offset-2"><input type="radio" name="usertype" value="user"  style="height:15px; width:15px;"> <b>User</b></label>
                                    </div>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-sm-2">Username:</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" name="username" placeholder="Enter username">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-sm-2">Password:</label>
                                  <div class="col-sm-10"> 
                                    <input type="password" class="form-control" name="password" placeholder="Enter password">
                                  </div>
                                </div>
                                <div class="form-group"> 
                                  <div class="col-sm-offset-2 col-sm-10 text-center">
                                    <button type="submit" class="btn btn-success">Login</button>
                                    <button type="reset" class="btn btn-warning">Cancel</button>
                                    <a href="forget-password.jsp" style="color:#fff;">Forgot Password?</a>
                                  </div>
                                </div>
                              </form>
                               <b>
                                    <a href="hospital-register.jsp" class="pull-left" style="color:#fff;">Hospital Registration</a></b>
                                    <b>
                                    <a href="user-register.jsp" class="pull-right" style="color:#fff;">User Registration</a></b>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="panel panel-default" style=" color:white;">
                            <div class="panel-body" >
                                <center><label style="font-size: 20px; color:#fff ">Notifications</label></center>
                                <hr>
                                <marquee direction="up"  height="300px">
                                    <%
                                    Database db=new Database();
                                    ResultSet rs=db.getNotifications();
                                    while(rs.next())
                                    {
                                    %>
                                    <div class="col-md-12">
                                        <label><%=rs.getString("title")%></label>
                                        <p><%=rs.getString("description")%></p>
                                        <hr>
                                    </div>
                                   <%
                                    }
                                    %>
                                </marquee>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
    </body>
</html>
