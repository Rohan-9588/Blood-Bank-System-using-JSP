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
       
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br><br></div>
                    <div class="col-md-1"></div>
                    <div class="col-lg-5">
                        <div class="panel panel-default" style="background-color: #616367d9; color:white; border-radius: 20px;">
                            <div class="panel-body scroll" >
                                <center><label style="font-size: 20px; color:#fff ">Reset Password?</label></center>
                                <hr>
                                <div class="col-lg-12 text-center">
                                 <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("0"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Username/Password invalid!</div> <br><br>");
                                                    }
                                                     if(status.equals("2"))
                                                    {
                                                        out.println("<p style='color:red; text-align:center;'>Email id does not exist.</p>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                   
                                </div>
                                    <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="forgetuser"/>
                                <div class="form-group"> 
                                  <div class="text-center col-md-12">
                                    <div class="radio">
                                        <label class=""><input type="radio" name="usertype" value="hospital" style="height:15px; width:15px;"> <b>Hospital</b></label>
                                        <label class="col-sm-offset-2"><input type="radio" name="usertype" value="user"  style="height:15px; width:15px;"> <b>User</b></label>
                                    </div>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-sm-3">Email ID</label>
                                  <div class="col-sm-9">
                                    <input type="text" class="form-control" name="email" placeholder="Enter email">
                                  </div>
                                </div>
                              
                                <div class="form-group"> 
                                  <div class="col-sm-offset-2 col-sm-10 text-center">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                  </div>
                                </div>
                              </form>
                               <b>
                                    <a href="index.jsp" class="pull-left" style="color:#fff;">Hospital Login</a></b>
                                    <b>
                                    <a href="index.jsp" class="pull-right" style="color:#fff;">User Login</a></b>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="panel panel-default" style="background-color: #616367d9; color:white; border-radius: 20px;">
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
