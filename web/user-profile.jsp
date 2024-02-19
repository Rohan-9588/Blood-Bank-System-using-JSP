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
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">My Photo</label></center>
                                <hr>
                                 <center>
                                 <%
                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("11"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Photo Updated successfully!</div><br><br>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                </center>
                                <%
                                if(photo!=null){
                                %>
                                <center><img src="uploads/<%=photo%>" style="width: 160px" ></center>
                                <%
                                    }else{
                                    %>
                                    <center>Image not found</center><br>
                                   
                                    <%
                                    }
                                %>
                                <br>
                                <form class="form-horizontal" method="post" enctype="multipart/form-data" action="includes/uploadFileUser.jsp">
                                        <div class="form-group"> 
                                            <label class="control-label col-sm-4">Upload Image</label>
                                            <div class="col-sm-8"> 
                                              <input type="file" class="form-control" name="file" required='true'>
                                            </div>
                                        </div>
                                        <div class="form-group"> 
                                            <div class="col-sm-12 text-center">
                                              <button type="submit" class="btn btn-success">Update</button>
                                            </div>
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                    <div class="col-md-1"></div>
                    <div class="col-md-12"></div>
                    <div class="col-md-1"></div>
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Change Password</label></center>
                                <hr>
                                <div class="col-lg-12 text-center">
                                <%
                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Password Changed successfully!</div><br><br>");
                                                    }
                                                    if(status.equals("0"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Current Password Not Exist</div><br><br>");
                                                    }
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Confirm password not match.</div><br><br>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                </div>
                                <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                        <input type="hidden" value="changeuserpass" name="action"/>
                                        <div class="form-group"> 
                                          <label class="control-label col-sm-3">Current Password:</label>
                                          <div class="col-sm-9"> 
                                              <input type="password" class="form-control" name="currpass" required="true" placeholder="Enter current password">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="control-label col-sm-3">New Password:</label>
                                          <div class="col-sm-9"> 
                                            <input type="password" class="form-control"  name="newpass" required="true" placeholder="Enter new password">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <label class="control-label col-sm-3">Confirm Password:</label>
                                          <div class="col-sm-9"> 
                                            <input type="password" class="form-control" name="confpass" required="true" placeholder="Enter confirm password">
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <div class="col-sm-offset-2 col-sm-10 text-center">
                                            <button type="submit" class="btn btn-success">Update</button>
                                            <button type="reset" class="btn btn-warning">Cancel</button>
                                          </div>
                                        </div>
                                    
                                      </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
