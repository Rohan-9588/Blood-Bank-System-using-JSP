<%-- 
    Document   : WebService
    Created on : Jan 26, 2018, 10:30:10 AM
    Author     : Brothers
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%
    Database db=new Database();
    String action=request.getParameter("action");
    System.out.println(action);
    switch(action){
        case "addhospital":
            String name=request.getParameter("name");
            String mobile=request.getParameter("mobile");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String pass=request.getParameter("password");
            String cpass=request.getParameter("confpassword");
            
            if(!pass.equals(cpass)){
                response.sendRedirect("../hospital-register.jsp?status=2");
            }else{
                int res=db.addHospital(name,address,mobile,email,pass);
                if(res>0){
                    String no=db.getRandomNumberString();
                    String msg="Your One Time Password (OTP) is "+no+" for validating hospital account.";
                    session.setAttribute("otpsession",no);
                    System.out.println(no);
                    response.sendRedirect("../hospital-register-otpverify.jsp?id="+res);
                }else{
                    response.sendRedirect("../hospital-register.jsp?status=0");
                }
            }
            break;
        case "verifyhospital":
            String otp=request.getParameter("otp");
            String idd=request.getParameter("id");
            String seotp=(String)session.getAttribute("otpsession");
            if(otp.equals(seotp)){
                int uphos=db.update_delete("update hospital set status=1 where id="+idd);
                if(uphos>0){
                    response.sendRedirect("../index.jsp?status=11");
                }
            }else{
                response.sendRedirect("../hospital-register-otpverify.jsp?status=0&id="+idd);
            }
            break;
         case "resendotp":
            String mobileno=request.getParameter("mobile");
            String noo=db.getRandomNumberString();
                    String msg="Your One Time Password (OTP) is "+noo+" for validating hospital account.";
                    session.setAttribute("otpsession",noo);
                    System.out.println(noo);
                    out.println(1);
            break;
        case "adduser":
            String uname=request.getParameter("name");
            String umobile=request.getParameter("mobile");
            String uaddress=request.getParameter("address");
            String uemail=request.getParameter("email");
            String udob=request.getParameter("dob");
            String ublgr=request.getParameter("bgroup");
            String ugender=request.getParameter("gender");
            String upass=request.getParameter("password");
            String ucpass=request.getParameter("confpassword");
            
            if(!upass.equals(ucpass)){
                response.sendRedirect("../user-register.jsp?status=2");
            }else{
                int resd=db.addUser(uname,uaddress,umobile,uemail,udob,ugender,ublgr,upass);
                if(resd>0){
                    String no=db.getRandomNumberString();
                    String msgg="Your One Time Password (OTP) is "+no+" for validating hospital account.";
                    session.setAttribute("otpsession",no);
                    System.out.println(no);
                    response.sendRedirect("../user-register-otpverify.jsp?id="+resd);
                }else{
                    response.sendRedirect("../user-register.jsp?status=0");
                }
            }
            break;
         case "verifyuser":
            String uotp=request.getParameter("otp");
            String uidd=request.getParameter("id");
            String useotp=(String)session.getAttribute("otpsession");
            if(uotp.equals(useotp)){
                int uphos=db.update_delete("update user set status=1 where id="+uidd);
                if(uphos>0){
                    response.sendRedirect("../index.jsp?status=12");
                }
            }else{
                response.sendRedirect("../user-register-otpverify.jsp?status=0&id="+uidd);
            }
            break;
        case "login":
            String username=request.getParameter("username");
            String password=request.getParameter("password");    
            String usertype=request.getParameter("usertype");
            try{
                if(usertype.equals("hospital")){
                    int resuser=db.checkHospitalLogin(username, password);
                    if(resuser>0){
                        session.setAttribute("userlogin",resuser);
                        response.sendRedirect("../hospital-home.jsp");
                    }else{
                        response.sendRedirect("../index.jsp?status=0");
                    }
                    
                    
                }else if(usertype.equals("user")){
                    int resuser=db.checkUserLogin(username, password);
                    if(resuser>0){
                        session.setAttribute("userlogin",resuser);
                        response.sendRedirect("../user-home.jsp");
                    }else{
                        response.sendRedirect("../index.jsp?status=0");
                    }
                }else{
                    response.sendRedirect("../index.jsp?status=0");
                }
            }catch(Exception e){
                response.sendRedirect("../index.jsp?status=2");
            }
            break;
          case "delete":
            String table=request.getParameter("table");
            String did=request.getParameter("id");
            boolean dreds=db.delete(table,Integer.parseInt(did));
            if(dreds){
                if(table.equals("notification")){
                    response.sendRedirect("../hospital-notification.jsp?status=3");
                }else if(table.equals("camp")){
                    response.sendRedirect("../hospital-camp.jsp?status=2");
                }else if(table.equals("camp_donor")){
                    response.sendRedirect("../hospital-camp-donors.jsp?status=2");
                }else if(table.equals("blood_request")){
                    response.sendRedirect("../hospital-request.jsp?status=2");
                }else if(table.equals("complaints")){
                    response.sendRedirect("../student-complaints.jsp?status=2");
                }
                
            }else{
                response.sendRedirect("../admin-notifications.jsp?status=0");
            }
            break;
          case "deleteall":
            String ttable=request.getParameter("table");
            String tdid=request.getParameter("id");
            boolean tdreds=db.delete(ttable,Integer.parseInt(tdid));
            if(tdreds){
                if(ttable.equals("blood_request")){
                    response.sendRedirect("../user-request.jsp?status=2");
                }
            }else{
                response.sendRedirect("../user-request.jsp?status=0");
            }
            break;
          case "deletedonor":
            String ctable=request.getParameter("table");
            String cdid=request.getParameter("id");
            String ccampid=request.getParameter("campid");
            boolean cdreds=db.delete(ctable,Integer.parseInt(cdid));
            if(cdreds){
                if(ctable.equals("camp_donor")){
                    response.sendRedirect("../hospital-camp-donors.jsp?status=2&id="+ccampid);
                }
            }else{
                response.sendRedirect("../admin-notifications.jsp?status=0");
            }
            break;
          case "addNotification":
            String title=request.getParameter("title");
            String descr=request.getParameter("description"); 
            boolean resuserpro=db.addNotification(title,descr);
            if(resuserpro){
                response.sendRedirect("../hospital-notification.jsp?status=1");
            }else{
                response.sendRedirect("../hospital-notification.jsp?status=0");
            }
            break;
        case "editNotification":
            String etitle=request.getParameter("title");
            String edescr=request.getParameter("descr");
            String edid=request.getParameter("id");
            boolean eresuserpro=db.editNotification(Integer.parseInt(edid),etitle,edescr);
            if(eresuserpro){
                response.sendRedirect("../hospital-notification.jsp?status=2");
            }else{
                response.sendRedirect("../hospital-notification.jsp?status=0");
            }
            break;
          case "addcamp":
            String location=request.getParameter("location");
            String caddress=request.getParameter("address");
            String date=request.getParameter("date");
            String time=request.getParameter("time");
            int hid= (Integer)session.getAttribute("userlogin");
            boolean res=db.addCamp(location,caddress,date,time,hid);
                if(res){
                    response.sendRedirect("../hospital-camp.jsp?status=1");
                }else{
                    response.sendRedirect("../hospital-camp.jsp?status=0");
                }
                
            break;
           case "adddonor":
            String user=request.getParameter("user");
            String daddress=request.getParameter("address");
            String dmobile=request.getParameter("mobile");
            String bgroup=request.getParameter("bgroup");
            String campid=request.getParameter("campid");
            boolean dres=db.addCampDonor(user,daddress,dmobile,bgroup,campid);
                if(dres){
                    response.sendRedirect("../hospital-camp-donors.jsp?status=1&id="+campid);
                }else{
                    response.sendRedirect("../hospital-camp-donors.jsp?status=0&id="+campid);
                }
                
            break;
          case "changestatus":
            String status=request.getParameter("status");
            String id=request.getParameter("id");
            int hhiid=(Integer)session.getAttribute("userlogin");
            boolean chngst=db.changeStatus(status,Integer.parseInt(id),hhiid);
            if(chngst){
                response.sendRedirect("../hospital-request.jsp?status=2");
            }else{
                response.sendRedirect("../hospital-request.jsp?status=0");
            }
            break;
          case "changehospipass":
            String currpass=request.getParameter("currpass"); 
            String npwd=request.getParameter("newpass");
            String confpass=request.getParameter("confpass");
            int hhid=(Integer)session.getAttribute("userlogin");
            if(confpass.equals(npwd)){
                int userpro=db.update_delete("update hospital set password='"+npwd+"' where password='"+currpass+"' and id="+hhid);
                if(userpro==1){
                    response.sendRedirect("../hospital-profile.jsp?status=1");
                }else{
                    response.sendRedirect("../hospital-profile.jsp?status=0");
                }
            }else{
                response.sendRedirect("../hospital-profile.jsp?status=2");
            }
           
            break;
         case "changeuserpass":
            String ucurrpass=request.getParameter("currpass"); 
            String unpwd=request.getParameter("newpass");
            String uconfpass=request.getParameter("confpass");
            int uuid=(Integer)session.getAttribute("userlogin");
            if(uconfpass.equals(unpwd)){
                int userpro=db.update_delete("update user set password='"+unpwd+"' where password='"+ucurrpass+"' and id="+uuid);
                if(userpro==1){
                    response.sendRedirect("../user-profile.jsp?status=1");
                }else{
                    response.sendRedirect("../user-profile.jsp?status=0");
                }
            }else{
                response.sendRedirect("../user-profile.jsp?status=2");
            }
           
            break;
        case "answerquery":
            String answer=request.getParameter("answer");
            String anqid=request.getParameter("id");
            int ansq=db.update_delete("update user_queries set answer='"+answer+"' where id="+anqid);
            if(ansq>0){
                response.sendRedirect("../hospital-queries.jsp?status=2");
            }else{
                response.sendRedirect("../hospital-queries.jsp?status=0");
            }
            break;
          case "userrequest":
            String urmobile=request.getParameter("mobile");
            String uraddress=request.getParameter("location");
            String urblgr=request.getParameter("bgroup");
            int uid= (Integer)session.getAttribute("userlogin");
            
                boolean rres=db.addBRequest(urmobile,uraddress,urblgr,uid);
                if(rres){
                    response.sendRedirect("../user-request.jsp?status=1");
                }else{
                    response.sendRedirect("../user-request.jsp?status=0");
                }
            break;
          case "addQuery":
            String query=request.getParameter("query");
            int uqid= (Integer)session.getAttribute("userlogin");
            
                boolean rqres=db.addUserQuery(query,uqid);
                if(rqres){
                    response.sendRedirect("../user-queries.jsp?status=1");
                }else{
                    response.sendRedirect("../user-queries.jsp?status=0");
                }
            break;
            case "forgetuser":
            String fusertype=request.getParameter("usertype"); 
            String fgemail=request.getParameter("email");
            String otp1=db.getRandomNumberString();
            if(fusertype.equals("user")){
                String gm=db.checkUserEmailExist(fgemail);
                if(gm!=""){
                    session.setAttribute("otp", otp1);
                    System.out.println(otp1);
                    response.sendRedirect("../forget-password-otp.jsp?fusertype="+fusertype+"&fgemail="+fgemail);
                }else{
                    response.sendRedirect("../forget-password.jsp?status=2");
                }
            }else{
                String gm=db.checkHospitalEmailExist(fgemail);
                System.out.println(gm);
                if(gm!=null){
                    session.setAttribute("otp", otp1);
                    System.out.println(otp1);
                    response.sendRedirect("../forget-password-otp.jsp?fusertype="+fusertype+"&fgemail="+fgemail);
                }else{
                    response.sendRedirect("../forget-password.jsp?status=2");
                }
            }
            
            break;
        case "otpverifyandsubmit":
            String usertype1=request.getParameter("usertype"); 
            String vemail=request.getParameter("email");
            String votp=request.getParameter("otp");
            String newpassword=request.getParameter("newpassword");
            String confpassword=request.getParameter("confpassword");
            String sessotp=(String)session.getAttribute("otp");
            if(votp.equals(sessotp)){
                if(newpassword.equals(confpassword)){
                    if(usertype1.equals("user")){
                            db.update_delete("update user set password='"+newpassword+"' where email='"+vemail+"'");
                            response.sendRedirect("../index.jsp?status=22");
                    }else{
                            db.update_delete("update user set password='"+newpassword+"' where email='"+vemail+"'");
                            response.sendRedirect("../index.jsp?status=22");
                    }
                }else{
                response.sendRedirect("../forget-password-otp.jsp?status=3&fusertype="+usertype1+"&fgemail="+vemail);
                }
            }else{
                response.sendRedirect("../forget-password-otp.jsp?status=0&fusertype="+usertype1+"&fgemail="+vemail);
            }
            
            break;
    }
    %>
