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
                                <center><label style="font-size: 20px; color:#fff ">User Queries</label></center>
                                <hr style="margin: 5px">
                                <br>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Sr.No.</th><th>User name</th><th>Queries</th><th>Answer</th><th>Action</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    ResultSet rs=db.getuserqueries();
                                    int i=1;
                                    while(rs.next())
                                    {
                                        int userid=rs.getInt("user_id");
                                        ResultSet userrs=db.getUserById(userid);
                                        userrs.next();
                                        
                                        String answer=rs.getString("answer");
                                        if(answer!=null){
                                        %>
                                    <tr>
                                        <td><%=i++%></td><td><%=userrs.getString("name")%></td><td><%=rs.getString("query")%></td><td><%=answer%></td>
                                        <td></td>
                                    </tr>
                                    <%
                                        }else{
                                        %>
                                    <tr>
                                        <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                        <input type="hidden" name="action" value="answerquery"/>
                                        <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                        <td><%=i++%></td><td><%=userrs.getString("name")%></td>
                                        <td><%=rs.getString("query")%></td>
                                        <td>
                                            <textarea style="width:100%" name="answer" required="true" class="form-control" rows="2"></textarea>
                                        </td>
                                        <td><button class="btn btn-primary">Submit</button></td>
                                        </form>
                                    </tr>
                                        <%
                                        }
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
