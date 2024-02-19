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
        <%@ include file="includes/user-header.jsp" %>  
        
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-color: #616367d9; color:white;">
                                <center><label style="font-size: 20px; color:#fff ">FAQ</label></center>
                                <hr style="margin: 5px">
                                <br>
                                <div class="col-lg-6">
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000">What are the minimum requirements to become a blood donor?</div>
                                        <div class="panel-body" style="color:#000">Check with your local blood bank to determine the specific requirements. You must be at least 16 years of age, a minimum of 110 pounds, and in basic good health.</div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000">Will donating blood hurt?</div>
                                        <div class="panel-body" style="color:#000">You might feel a slight sting in the beginning lasting only a couple of seconds, but there should be no discomfort during the donation.</div>
                                    </div>
                                </div>
                                <div class="col-md-12"><br></div>
                                <div class="col-lg-6">
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000">Are blood donors paid?</div>
                                        <div class="panel-body" style="color:#000">No. Blood collected for transfusion in the India is collected from volunteer blood donors.</div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000">How badly is blood needed?</div>
                                        <div class="panel-body" style="color:#000">Blood supplies vary depending on the region and time of year. As more restrictive donor criteria are necessary to protect the safety of the blood supply and as the donor population ages, the inventory levels are affected across the nation. If you are eligible, your blood donations are needed. The inventory levels of blood would be more consistently maintained if more of those who are eligible donate 1-2 times each year.</div>
                                    </div>
                                </div>
                                <div class="col-md-12"><br></div>
                                <div class="col-lg-6">
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000">How much blood is taken?</div>
                                        <div class="panel-body" style="color:#000">For a whole blood donation, approximately 500 ml or one-half liter of blood is collected. For donations of other blood products, such as platelet or plasma, the amount collected depends on your height, weight and platelet count.</div>
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="panel panel-primary" style="background-color: #ffffff;">
                                        <div class="panel-footer" style="color:#000">How often may I donate?</div>
                                        <div class="panel-body" style="color:#000">The Medical Director of each blood donor center is responsible for setting policies regarding the frequency of donation. The policies set by a Medical Director can be more restrictive, permitting donation less frequently than permitted by AABB Standards and FDA regulations. Based on AABB and FDA requirements, you must wait 56 days between whole blood donations. Platelet (apheresis) donors may donate more frequently. This is because the body replenishes platelets and plasma more quickly than red cells. Platelets will return to normal levels within about 72 hours of donating. Plasma (the liquid portion of your blood) will return to normal levels within a couple of days. </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
