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
       <%@ include file="includes/hospital-header.jsp" %>  
        
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Blood Donation Camp Donors</label></center>
                                <hr style="margin: 5px">
                                 <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                   
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Donor deleted successfully!</div><br><br>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                 </div>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Sr.No.</th><th>Name</th><th>Address</th><th>Mobile no</th><th>Blood Group</th><th>Action</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    int cid=Integer.parseInt(request.getParameter("id"));
                                    ResultSet rs=db.getCampDonersByCampId(cid);
                                    int i=1;
                                    while(rs.next())
                                    {
                                        int userid=rs.getInt("user_id");
                                        ResultSet userrs=db.getUserById(userid);
                                        userrs.next();
                                        %>
                                    <tr>
                                        <td><%=i++%></td><td><%=userrs.getString("name")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("mobile")%></td><td><%=rs.getString("bgroup")%></td>
                                        <td>
                                            <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                    <input type="hidden" name="action" value="deletedonor"/>
                                                    <input type="hidden" name="table" value="camp_donor"/>
                                                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                    <input type="hidden" name="campid" value="<%=cid%>"/>
                                                    <button type="submit" class="btn btn-danger btn-xs" >Remove</button>
                                                </form>
                                        </td>
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
                                <center><label style="font-size: 20px; color:#fff ">Add Donor</label></center>
                                <hr>
                                <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Donor added successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                </div>
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="adddonor"/>
                                    <input type="hidden" name="campid" value="<%=cid%>"/>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Select User</label>
                                        <select class="form-control" name="user" required="true">
                                            <option value="">Select Any One</option>
                                            <%
                                                ResultSet rsu=db.getUsers();
                                                while(rsu.next()){
                                            %>
                                            <option value="<%=rsu.getInt("id")%>"><%=rsu.getString("name")%></option>
                                            
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Address</label>
                                        <input type="text" class="form-control" name="address" required="true" placeholder="Enter Address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Mobile no</label>
                                        <input type="number" class="form-control" name="mobile" required="true" placeholder="Enter mobile no">
                                    </div>
                                </div>
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
