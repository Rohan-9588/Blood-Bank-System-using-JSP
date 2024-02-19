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
                    <%
                                    int uselogid=(Integer)session.getAttribute("userlogin");
                                    Database db=new Database();
                                    ResultSet rs=db.getUserById(uselogid);
                                    if(rs.next())
                                    {
                                        String photo=rs.getString("photo");
                                    %>
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">My Profile</label></center>
                                <hr>
                                <table class="table table-bordered">
                                    <tr><th>User Name</th><td><%=rs.getString("name")%></td></tr>
                                    <tr><th>Mobile no</th><td><%=rs.getString("mobile")%></td></tr>
                                    <tr><th>Address</th><td><%=rs.getString("address")%></td></tr>
                                    <tr><th>Email ID</th><td><%=rs.getString("email")%></td></tr>
                                    <tr><th>DOB</th><td><%=rs.getString("dob")%></td></tr>
                                    <tr><th>Blood Group</th><td><%=rs.getString("bgroup")%></td></tr>
                                    <tr><th>Gender</th><td><%=rs.getString("gender")%></td></tr>
                                </table>
                            </div>
                        </div>
                    </div>
                                <%
                                }
                                %>
                                <%
                                    
                                int point=db.getUserPoints(uselogid);
                                %>
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">My Points</label></center>
                                <hr>
                                <center><h1 style="font-size: 9em;">2<%=point%></h1></center>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-1"></div>
                    <div class="col-md-12"></div>
                    
                </div>
            </div>
    </body>
</html>
