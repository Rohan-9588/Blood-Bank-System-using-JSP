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
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Request of blood</label></center>
                                <hr>
                                <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                   
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Request change successfully!</div><br><br>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                 </div>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Sr.No.</th><th>Name</th><th>Blood Group</th><th>Location</th><th>Mobile no</th><th>Action</th>
                                    </tr>
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
                                    <tr>
                                        <td>1</td><td><%=userrs.getString("name")%></td><td><%=rs.getString("bgroup")%></td><td><%=rs.getString("location")%></td><td><%=rs.getString("mobile")%></td><td>
                                             <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                    <input type="hidden" name="action" value="changestatus"/>
                                            <%
                                            int status=rs.getInt("status");
                                            if(status==1){
                                                %>
                                                <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                <input type="hidden" name="status" value="0"/>
                                                <button type="submit" class="btn btn-danger btn-xs" >Reject</button>
                                                <%
                                            }else{
                                                 %>
                                                <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                <input type="hidden" name="status" value="1"/>
                                                <button type="submit" class="btn btn-success btn-xs" >Accept</button>
                                                <%
                                            }
                                            %>
                                            <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
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
                    
                </div>
            </div>
    </body>
</html>
