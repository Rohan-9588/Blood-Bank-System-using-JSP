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
                                <center><label style="font-size: 20px; color:#fff ">Blood Bank</label></center>
                                <hr>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Sr.No.</th><th>Blood Group</th><th>Quantity</th>
                                    </tr>
                                    <%
                                    int uqid= (Integer)session.getAttribute("userlogin");
                                    Database db=new Database();
                                    int i=1;
                                   
                                        ResultSet rs1=db.selectAll("select bgroup,count(bgroup) as bgr from camp_donor where camp_id in (select id from camp where hospital_id="+uqid+") group by bgroup");
                                        while(rs1.next()){
                                            String bgroup=rs1.getString("bgroup");
                                            
                                            ResultSet rem=db.selectAll("select count(*) as totmin from blood_request where bgroup='"+bgroup+"' and status=1 and hospital_id="+uqid);
                                            rem.next();
                                            int totmin=rem.getInt("totmin");
                                            
                                            int bgr=rs1.getInt("bgr")-totmin;
                                    %>
                                            <tr>
                                                <td><%=i++%></td><td><%=bgroup%></td><td><%=bgr%> Units</td>
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
