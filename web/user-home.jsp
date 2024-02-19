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
        
        <%@ include file="includes/user-header.jsp" %>  
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br><br></div>
                    <div class="col-md-1"></div>
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Urgency of blood</label></center>
                                <hr>
                                <marquee direction="up"  height="300px" style="cursor: pointer;" onclick="window.location.href='hospital-request.jsp';">
                                   <%
                                    Database db=new Database();
                                    ResultSet rs=db.getBloodRequest();
                                    int i=1;
                                    while(rs.next())
                                    {
                                        int userid=rs.getInt("user_id");
                                        ResultSet userrs=db.getUserById(userid);
                                        userrs.next();
                                        %>
                                    <div class="col-md-12">
                                        <label><%=rs.getString("bgroup")%> Blood Group</label>
                                        <p><%=userrs.getString("name")%> at <%=rs.getString("location")%></p>
                                        <hr>
                                    </div>
                                    <%
                                    }
                                    %>
                                </marquee>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Notifications</label></center>
                                <hr>
                                <marquee direction="up"  height="300px">
                                    <%
                                    ResultSet rs1=db.getNotifications();
                                    while(rs1.next())
                                    {
                                    %>
                                    <div class="col-md-12">
                                        <label><%=rs1.getString("title")%></label>
                                        <p><%=rs1.getString("description")%></p>
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
