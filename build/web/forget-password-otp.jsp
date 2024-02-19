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
                                                        out.println("<p style='color:red; text-align:center;'>Invalid OTP Entered.</p>");
                                                    }
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<p style='color:red; text-align:center;'>Email id does not exist.</p>");
                                                    }
                                                    if(status.equals("3"))
                                                    {
                                                        out.println("<p style='color:red; text-align:center;'>Confirm password does not match.</p>");
                                                    }
                             }
                    catch(Exception e){}
                    String fusertype=request.getParameter("fusertype");
                    String fgemail=request.getParameter("fgemail");
                    Database db=new Database();
                    ResultSet rs=null;
                    if(fusertype.equals("user")){
                            rs=db.selectAll("select * from user where email='"+fgemail+"'");
                    }else{
                            rs=db.selectAll("select * from hospital where email='"+fgemail+"'");
                    }
                    rs.next();
                    
                                    %>
                                    
                                    
                                </div>
                                    <form class="form-horizontal" method="post" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="otpverifyandsubmit"/>
                                <div class="form-group"> 
                                  <div class="text-center col-md-12">
                                    <div class="radio">
                                        <%
                                        
                                        if(fusertype.equals("user")){
                                            %>
                                        <label class=""><input type="radio" name="usertype" value="user" checked style="height:15px; width:15px;"> <b>User</b></label>
                                            <%
                                        }else{
                                            %>
                                        <label class=""><input type="radio" name="usertype" checked value="hospital"  style="height:15px; width:15px;"> <b>Hospital</b></label>
                                        <%
                                        }
                                        %>
                                    </div>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label class="control-label col-sm-2">Email:</label>
                                  <div class="col-sm-10">
                                      <input type="text" class="form-control" name="email" readonly="true" value="<%=request.getParameter("fgemail")%>" placeholder="Enter email id">
                                  </div>
                                </div>
                                 <div class="col-md-8">
                                    <label>OTP</label>
                                    <input type="text" class="form-control" placeholder="Enter OTP" required="true" name="otp" style="margin-bottom:5px;"/>
                                </div>
                                <div class="col-md-4"><br>
                                            <a href="javascript:sendsms('<%=rs.getString("mobile")%>');" class="btn btn-info btn-xs">Resend OTP</a>
                                        </div> 
                                <div class="col-md-6">
                                    <label>New Password</label>
                                    <input type="password" class="form-control" required="true" name="newpassword" style="margin-bottom:5px;"/>
                                </div>
                                 <div class="col-md-6">
                                    <label>Confirm Password</label>
                                    <input type="password" class="form-control" required="true" name="confpassword" style="margin-bottom:5px;"/>
                                </div>
                                <div class="form-group"> 
                                  <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                  </div>
                                </div>
                              </form>
                               
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
                                    ResultSet rss=db.getNotifications();
                                    while(rss.next())
                                    {
                                    %>
                                    <div class="col-md-12">
                                        <label><%=rss.getString("title")%></label>
                                        <p><%=rss.getString("description")%></p>
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