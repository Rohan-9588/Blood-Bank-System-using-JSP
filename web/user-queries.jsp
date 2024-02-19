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
                                <center><label style="font-size: 20px; color:#fff ">My Queries</label></center>
                                <hr style="margin: 5px">
                                <br>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Sr.No.</th><th>Queries</th><th>Answer</th><th>Action</th>
                                    </tr>
                                    <%
                                    int uuid=(Integer)session.getAttribute("userlogin");
                                    Database db=new Database();
                                    ResultSet rs=db.getuserqueriesByid(uuid);
                                    int i=1;
                                    while(rs.next())
                                    {
                                        %>
                                    <tr>
                                        <td>1</td><td><%=rs.getString("query")%></td><td><%=rs.getString("answer")%></td>
                                        <td>
                                            <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                    <input type="hidden" name="action" value="deleteall"/>
                                                    <input type="hidden" name="table" value="user_queries"/>
                                                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
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
                                <center><label style="font-size: 20px; color:#fff ">Ask Query</label></center>
                                <hr>
                                 <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Query added successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                </div>
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="addQuery"/>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <label class="control-label">Your Query</label>
                                        <input type="text" class="form-control" name="query" required="true" placeholder="Enter query">
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
