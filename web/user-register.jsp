<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

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
                    
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">User Registration</label></center>
                                <hr>
                                 <div class="col-lg-12 text-center">
                                 <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Confirm password does not match!</div>");
                                                    }
                                                    
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;' >User Registration Successfull!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                    <br><br>
                                </div>
                                    <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="adduser"/>
                                <div class="col-lg-6">    
                                <div class="form-group">
                                  <label class="control-label col-sm-4">Name</label>
                                  <div class="col-sm-8">
                                      <input type="text" class="form-control" required="true" name="name" placeholder="Enter name">
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                  <label class="control-label col-sm-4">Mobile No.</label>
                                  <div class="col-sm-8"> 
                                    <input type="number" class="form-control" required="true" name="mobile" placeholder="Enter mobileno">
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="form-group">
                                  <label class="control-label col-sm-4">Address</label>
                                  <div class="col-sm-8"> 
                                    <input type="text" class="form-control" required="true" name="address" placeholder="Enter address">
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="form-group">
                                  <label class="control-label col-sm-4">Email Id (Username)</label>
                                  <div class="col-sm-8"> 
                                    <input type="email" class="form-control" required="true" name="email" placeholder="Enter email">
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="form-group">
                                  <label class="control-label col-sm-4">DOB</label>
                                  <div class="col-sm-8"> 
                                    <input type="date" class="form-control" required="true" name="dob" placeholder="Enter DOB">
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="form-group">
                                  <label class="control-label col-sm-4" for="pwd">Blood Group</label>
                                  <div class="col-sm-8"> 
                                      <select class="form-control" required="true" name="bgroup">
                                          <option value="">Select Option</option>
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
                                </div>
                                <div class="col-lg-6">
                                <div class="form-group"> 
                                  <div class="text-center col-md-12">
                                    <div class="radio">
                                        <label class=""><input type="radio" name="gender" checked style="height:15px; width:15px;"> <b>Male</b></label>
                                        <label class="col-sm-offset-2"><input type="radio" name="gender"  style="height:15px; width:15px;"> <b>Female</b></label>
                                    </div>
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="form-group">
                                  <label class="control-label col-sm-4">Password</label>
                                  <div class="col-sm-8"> 
                                    <input type="password" class="form-control" name="password"  required="true" placeholder="Enter password">
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="form-group">
                                  <label class="control-label col-sm-4">Confirm Password</label>
                                  <div class="col-sm-8"> 
                                    <input type="password" class="form-control"  required="true" name="confpassword" placeholder="Enter confirm password">
                                  </div>
                                </div>
                                </div>
                                <div class="col-lg-12">
                                <div class="form-group"> 
                                  <div class=" text-center">
                                    <button type="submit" class="btn btn-success">Register</button>
                                    <button type="reset" class="btn btn-warning">Cancel</button>
                                  </div>
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
