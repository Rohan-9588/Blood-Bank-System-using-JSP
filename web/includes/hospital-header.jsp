                    <%
                        String uri = request.getRequestURI();
                        String pageName = uri.substring(uri.lastIndexOf("/")+1);
                        
                   
                    %>
             
                
                 <div class=""  style=" display: inline-block; width: 100%; background-image: url('images/depositphotos_150904030-stock-illustration-macro-streaming-red-blood-cells.jpg')">
            <div class="col-md-4">
                <!--<center><img src="images/blood-logo-template-vector-24780482.jpg" style="width: 100px"/></center>-->
            </div>
            <div class="col-md-5">
                
                <center>
                    <h1 style="color:#fff; font-size: 50px;"><b>Blood Bank System</b></h1</center>
            </div>
            <div class="col-md-4"></div>
        </div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                
                 <ul class="nav navbar-nav">
                   <li class='<% if(pageName.equals("hospital-home.jsp")){ out.println("active"); } %>'><a href="hospital-home.jsp">Home</a></li>
                    <li class='<% if(pageName.equals("hospital-camp.jsp")){ out.println("active"); } %>'><a href="hospital-camp.jsp">Camp News</a></li>
                    <li class='<% if(pageName.equals("hospital-request.jsp")){ out.println("active"); } %>'><a  href="hospital-request.jsp">View Request</a></li>
                    <li class='<% if(pageName.equals("hospital-bank.jsp")){ out.println("active"); } %>'><a href="hospital-bank.jsp">Blood Bank</a></li>
                    <li class='<% if(pageName.equals("hospital-notification.jsp")){ out.println("active"); } %>'><a href="hospital-notification.jsp">Notifications</a></li>
                    <li class='<% if(pageName.equals("hospital-faq.jsp")){ out.println("active"); } %>'><a href="hospital-faq.jsp">FAQ</a></li>
                    <li class='<% if(pageName.equals("hospital-profile.jsp")){ out.println("active"); } %>'><a href="hospital-profile.jsp">My Profile</a></li>
                    <li class='<% if(pageName.equals("hospital-queries.jsp")){ out.println("active"); } %>'><a href="hospital-queries.jsp">User Queries</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
        </nav>