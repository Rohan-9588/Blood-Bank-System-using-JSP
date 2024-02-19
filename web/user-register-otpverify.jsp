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
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">User Registration   </label></center>
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
                                                    if(status.equals("0"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;' >Invalid OTP! Try Again!</div>");
                                                    }
                             }
                    catch(Exception e){}
                    
                    String id=request.getParameter("id");
                    Database db=new Database();
                    ResultSet rs=db.getUserById(Integer.parseInt(id));
                    rs.next();
                    %>
                                    <br><br>
                                </div>
                                    <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                        <input type="hidden" name="action" value="verifyuser"/>
                                        <input type="hidden" name="id" value="<%=id%>"/>
                                        <div class="col-lg-5">
                                            <div class="form-group">
                                              <label class="col-sm-4">User Name :</label>
                                              <div class="col-sm-5">
                                                <%=rs.getString("name")%>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                              <label class="col-sm-5">Enter OTP</label>
                                              <div class="col-sm-7"> 
                                                <input type="number" class="form-control" name="otp" required="true" placeholder="Enter OTP">
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="javascript:sendsms('<%=rs.getString("mobile")%>');" class="btn btn-info pull-left btn-xs">Resend OTP</a>
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
<script>
    function sendsms(mob){
        if(confirm("Are you sure?")){
            $.ajax({
                url:"includes/WebService.jsp",
                method:"POST",
                data:{"action":"resendotp","mobile":mob},
                success:function(res){
                    //alert(res);
                    if(res==1){
                        alert("OTP Send Successfully!");
                    }
                }
            });
        }
    }
</script>