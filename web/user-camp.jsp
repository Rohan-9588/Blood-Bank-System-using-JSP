<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Blood Donation Camp List</label></center>
                                <hr style="margin: 5px">
                                <%
                                    Database db=new Database();
                                    ResultSet rs=db.getCamp();
                                    int i=1;
                                    while(rs.next())
                                    {
                                        String time=rs.getString("time");
                                        int hid=rs.getInt("hospital_id");
                                        ResultSet rsh=db.getHospitalById(hid);
                                        rsh.next();
                                        
                                        
                                         try {
    final SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                final Date dateObj = sdf.parse(time);
                time = new SimpleDateFormat("hh:mm aa").format(dateObj);
            } catch (final ParseException e) {
                e.printStackTrace();
            }

                                    %>
                                <div class="col-lg-4">
                                    <label>Date <%=rs.getString("date")%> & Time <%=time%> at </label>
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000"><%=rsh.getString("name")%></div>
                                        <div class="panel-body" style="color:#000"><%=rs.getString("location_name")%>, <%=rs.getString("address")%></div>
                                    </div>
                                </div>
                                <%
                                }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
