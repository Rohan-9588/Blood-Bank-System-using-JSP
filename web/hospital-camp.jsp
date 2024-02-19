<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
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
                                <center><label style="font-size: 20px; color:#fff ">Blood Donation Camp List</label></center>
                                <hr style="margin: 5px">
                                <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                   
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='label label-danger' style='font-size: 15px;'>Camp deleted successfully!</div><br><br>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                </div>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Sr.No.</th><th>Location Name</th><th>Location Address</th><th>Date</th><th>Time</th><th>Action</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    int suselogid= (Integer)session.getAttribute("userlogin");
                                    ResultSet rs=db.getCampByHospitalId(suselogid);
                                    int i=1;
                                    while(rs.next())
                                    {
                                        String time=rs.getString("time");
                                         try {
    final SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
                final Date dateObj = sdf.parse(time);
                time = new SimpleDateFormat("hh:mm aa").format(dateObj);
            } catch (final ParseException e) {
                e.printStackTrace();
            }

                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><%=rs.getString("location_name")%></td><td><%=rs.getString("address")%></td><td><%=rs.getString("date")%></td><td><%=time%></td>
                                        <td>
                                            <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                    <a href="hospital-camp-donors.jsp?id=<%=rs.getInt("id")%>" class="btn btn-warning btn-xs">Donors</a>
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="table" value="camp"/>
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
                                <center><label style="font-size: 20px; color:#fff ">Add camp</label></center>
                                <hr>
                                <div class="col-lg-12 text-center">
                                <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='label label-success' style='font-size: 15px;'>Camp added successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                </div>
                                <form class="form-horizontal" action="includes/WebService.jsp">
                                    <input type="hidden" name="action" value="addcamp"/>

                                
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Location Name</label>
                                        <input type="text" class="form-control" name="location" required="true" placeholder="Enter name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Location Address</label>
                                        <input type="text" class="form-control" name="address" required="true" placeholder="Enter Address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Date</label>
                                        <input type="date" class="form-control" name="date" required="true" placeholder="Select date">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <label class="control-label">Time</label>
                                        <input type="time" class="form-control" name="time" required="true" placeholder="Select time">
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
