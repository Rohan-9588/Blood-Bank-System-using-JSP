<%@page import="database.Database"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  int uselogid=(Integer)session.getAttribute("userlogin");
   
    String saveFile =new String();
    String contentType=request.getContentType();
//    out.println(contentType);
    if((contentType!=null) && (contentType.indexOf("multipart/form-data")>=0)){
        DataInputStream in=new DataInputStream(request.getInputStream());
        int formDataLength=request.getContentLength();
        byte dataBytes[]=new byte[formDataLength];
        int byteRead=0;
        int totalBytesRead=0;
        
        while(totalBytesRead<formDataLength)
        {
            byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
            totalBytesRead+=byteRead;
        }
        
        String file=new String(dataBytes,"CP1256");
        
        saveFile=file.substring(file.indexOf("filename=\"")+ 10);
        saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
        saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
        
        int lastIndex=contentType.lastIndexOf("=");
        String boundary=contentType.substring(lastIndex+1, contentType.length());
        
        int pos;
        pos=file.indexOf("filename=\"");
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        
        int boundaryLocation=file.indexOf(boundary,pos);
        
        //int startPos=((file.substring(0,pos)).getBytes()).length;
        int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
        //int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;
        //out.println(file);
        //out.println(endPos);
        String saveFile1="/home/akshay/NetBeansProjects/blood bank system/web/uploads/"+saveFile;
        File ff=new File(saveFile1);
        try{
            FileOutputStream fileout=new FileOutputStream(ff);
            fileout.write(dataBytes,startPos,(endPos-startPos));
            fileout.flush();
            Database db=new Database();
            out.println(saveFile);
            int res=db.update_delete("update user set photo='"+saveFile+"' where id="+uselogid);
            if(res>0){
                response.sendRedirect("../user-profile.jsp?status=11");
            }else{
                response.sendRedirect("../user-profile.jsp?status=22");
            }
        }catch(Exception e){
            out.println(e);
        }
    }
%>