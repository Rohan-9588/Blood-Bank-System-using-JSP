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
                    <li class='<% if(pageName.equals("index.jsp")){ out.println("active"); } %>'><a href="index.jsp">Home</a></li>
                    <li class='<% if(pageName.equals("camp.jsp")){ out.println("active"); } %>'><a href="camp.jsp">Camp</a></li>
                    <li class='<% if(pageName.equals("search.jsp")){ out.println("active"); } %>'><a href="search.jsp">Search</a></li>
                    <li class='<% if(pageName.equals("about.jsp")){ out.println("active"); } %>'><a href="about.jsp">About Us</a></li>
                    <li class='<% if(pageName.equals("contact.jsp")){ out.println("active"); } %>'><a href="contact.jsp">Contact Us</a></li>
                    <li class='<% if(pageName.equals("faq.jsp")){ out.println("active"); } %>'><a href="faq.jsp">FAQ</a></li>
                </ul>
                
            </div>
        </nav>