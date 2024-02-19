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
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body" style=" color:white;">
                                <center><label style="font-size: 20px; color:#fff ">Search availability of Blood or Hospital</label></center>
                                <hr style="margin: 5px">
                                <br>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <form class="form-horizontal" method="POST" action="">
                                        <div class="form-group">
                                          <label class="control-label col-sm-6">Select Blood Group</label>
                                          <div class="col-sm-5">
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
                                                  <option>All</option>
                                              </select>
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <div class="col-sm-offset-2 col-sm-10 text-center">
                                              <button type="submit" class="btn btn-success">Search</button>
                                          </div>
                                        </div>
                                    </form>
                                    </div>
                                    <div class="col-md-6">
                                        <form class="form-horizontal" action="" method="post">
                                        <div class="form-group">
                                          <label class="control-label col-sm-6">Search by hospital name</label>
                                          <div class="col-sm-5">
                                              <input type="text" class="form-control" name="hospitalname" placeholder="Enter hospital name">
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <div class="col-sm-offset-2 col-sm-10 text-center">
                                            <button type="submit" class="btn btn-success">Search</button>
                                          </div>
                                        </div>
                                    </form>
                                    </div>
                                </div>
                                <%
                                Database db=new Database();
                                String bgroup="";
                                ResultSet res=null;
                                try{
                                bgroup=request.getParameter("bgroup");
                                
                                    if(bgroup.equals("All")){
                                        res=db.selectAll("select * from hospital where id in (select DISTINCT(hospital_id) from camp where id in (select DISTINCT(camp_id) from camp_donor'))");
                                    }else{
                                        res=db.selectAll("select * from hospital where id in (select DISTINCT(hospital_id) from camp where id in (select DISTINCT(camp_id) from camp_donor where bgroup='"+bgroup+"'))");
                                    }
                                }catch(Exception e){
                                   res=db.selectAll("select * from hospital where id in (select DISTINCT(hospital_id) from camp where id in (select DISTINCT(camp_id) from camp_donor'))"); 
                                }
                                
                                if(res!=null){
                                while(res.next()){
                                %>
                                <div class="col-lg-4">
                                    <label style="color:greenyellow"><%=bgroup%> Available</label>
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000"><%=res.getString("name")%></div>
                                        <div class="panel-body" style="color:#000"><%=res.getString("address")%></div>
                                    </div>
                                </div>
                                <%
                                }
}
                                
                                String hospitalname=request.getParameter("hospitalname");
                                ResultSet tothosp=db.selectAll("select * from hospital where name like '%"+hospitalname+"%'  and status=1");
                                    if(tothosp!=null){
                                    while(tothosp.next()){
                                    int hospitalid=tothosp.getInt("id");
                                     String bgroup1="";
                                    ResultSet res1=db.selectAll("select bgroup from camp_donor where camp_id in (select id from camp where hospital_id="+hospitalid+" ) group by bgroup");
                                    while(res1.next()){
                                    bgroup1+=res1.getString("bgroup")+", ";
                                    
                                    }
                                    %>
                                    <div class="col-lg-4">
                                        <label style="color:greenyellow"><%=bgroup1%> Available</label>
                                        <div class="panel panel-primary" style="background-color: #ffffff;">
                                            <div class="panel-footer" style="color:#000"><%=tothosp.getString("name")%></div>
                                            <div class="panel-body" style="color:#000"><%=tothosp.getString("address")%></div>
                                        </div>
                                    </div>
                                    <%
                                }}

                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
