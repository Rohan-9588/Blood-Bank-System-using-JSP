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
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Blood Request</label></center>
                                <hr style="margin: 5px">
                                <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                   
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Request deleted successfully!</div><br><br>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                 </div>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Sr.No.</th><th>Blood Group</th><th>Mobile number</th><th>Location</th><th>Status</th><th>Action</th>
                                    </tr>
                                    <%
                                    int uselogid=(Integer)session.getAttribute("userlogin");
                                    Database db=new Database();
                                    ResultSet rs=db.getBloodRequestByUserId(uselogid);
                                    int i=1;
                                    while(rs.next())
                                    {
                                        %>
                                    <tr>
                                        <td><%=i++%></td><td><%=rs.getString("bgroup")%></td><td><%=rs.getString("mobile")%></td><td><%=rs.getString("location")%></td>
                                        <td>
                                            <%
                                                String status=rs.getString("status");
                                            if(status.equals("1")){
                                                out.println("<p class='label label-success'>Accepted</p>");
                                            }else{
                                                out.println("<p class='label label-warning'>Pending</p>");
                                            }
                                            %>
                                        </td>
                                        <td>
                                        <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                            <input type="hidden" name="table" value="blood_request"/>
                                            <input type="hidden" name="action" value="deleteall"/>
                                            <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                            <button class="btn btn-danger btn-xs">Remove</button>
                                        </form>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Add Request</label></center>
                                <hr>
                                 <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                   
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Request added successfully!</div><br><br>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                 </div>
                                <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                <input type="hidden" name="action" value="userrequest"/>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Blood Group</label>
                                        <select class="form-control" name="bgroup" required="true">
                                            <option value=''>Select</option>
                                                  <option>A+</option>
                                                  <option>A-</option>
                                                  <option>B+</option>
                                                  <option>B-</option>
                                                  <option>AB+</option>
                                                  <option>AB-</option>
                                                  <option>O+</option>
                                                  <option>O-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Mobile number</label>
                                        <input type="number" class="form-control" name="mobile" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Location</label>
                                        <input type="text" class="form-control" name="location" required="true">
                                    </div>
                                </div>
                                
                                <div class="form-group"> 
                                  <div class=" text-center">
                                    <button type="submit" class="btn btn-success">Submit</button>
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
