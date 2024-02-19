/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package database;
import java.io.InputStream;
import java.sql.*;
import java.text.DateFormat;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.swing.JOptionPane;
public class Database
{
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    public Database() throws SQLException
    {
        try{
            
            //MAKE SURE YOU KEEP THE mysql_connector.jar file in java/lib folder
            //ALSO SET THE CLASSPATH
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/blood","root","123456");
            System.out.println("connetion success.....");
            
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("exception : "+e);
        }
    }
    //ip:username,password
    //return boolean
   
    public int checkUserLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from user where email='"+uname+"' and password='"+pwd+"' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return 0;
    }
    public int checkHospitalLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from hospital where email='"+uname+"' and password='"+pwd+"' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return 0;
    }
    
    public Boolean addNotification(String title,String descr)
    {
        try {
            pst=con.prepareStatement("insert into notification (title,description) values(?,?)");
            pst.setString(1, title);
            pst.setString(2, descr);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public ResultSet getNotifications()
    {
        try {
            pst=con.prepareStatement("select * from notification");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getNotificationById(int id)
    {
        try {
            pst=con.prepareStatement("select * from notification where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public Boolean editNotification(int id, String title,String descr)
    {
        try {
            pst=con.prepareStatement("update notification set title=?,description=? where id=?");
            pst.setString(1, title);
            pst.setString(2, descr);
            pst.setInt(3, id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public Boolean addCamp(String locationname,String address,String date,String time,int hospid)
    {
        try {
            pst=con.prepareStatement("insert into camp (location_name,address,date,time,hospital_id) values(?,?,?,?,?)");
            pst.setString(1, locationname);
            pst.setString(2, address);
            pst.setString(3, date);
            pst.setString(4, time);
            pst.setInt(5, hospid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public Boolean addBRequest(String mobile,String address,String bgroup,int uid)
    {
        try {
            pst=con.prepareStatement("insert into blood_request (mobile,location,bgroup,user_id,status) values(?,?,?,?,?)");
            pst.setString(1, mobile);
            pst.setString(2, address);
            pst.setString(3, bgroup);
            pst.setInt(4, uid);
            pst.setInt(5, 0);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    
    public boolean delete(String tab,int id){
        try {
            pst=con.prepareStatement("delete from "+tab+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            System.out.println(n);
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
        
    }
    
    public boolean changeStatus(String st,int id,int hhiid){
        try {
            pst=con.prepareStatement("update blood_request set status='"+st+"',hospital_id="+hhiid+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            System.out.println(n);
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
        
    }
    
    public ResultSet getUserById(int id)
    {
        try {
            pst=con.prepareStatement("select * from user where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getuserqueriesByid(int id)
    {
        try {
            pst=con.prepareStatement("select * from user_queries where user_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
     public ResultSet getHospitalById(int id)
    {
        try {
            pst=con.prepareStatement("select * from hospital where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    
     
     public int addUser(String name,String address,String mobno,String email,String dob,String gender,String bgroup,String password){
         try {
            pst=con.prepareStatement("insert into user (name,address,mobile,email,dob,gender,bgroup,password,status) values(?,?,?,?,?,?,?,?,1)",Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, dob);
            pst.setString(6, gender);
            pst.setString(7, bgroup);
            pst.setString(8, password);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
     }
     
     public boolean udpateUser(int id,String name,String address,String mobno,String email,String dob,String gender,String bgroup){
         try {
            pst=con.prepareStatement("update user set name=?,address=?,mobile=?,email=?,dob=?,gender=?,bgroup=? where id=?");
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, dob);
            pst.setString(6, gender);
            pst.setString(7, bgroup);
            pst.setInt(8, id);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
     }
     
     public int addHospital(String name,String address,String mobno,String email,String password){
         try {
            pst=con.prepareStatement("insert into hospital (name,address,mobile,email,password,status) values(?,?,?,?,?,0)",Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, password);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            ResultSet keys = pst.getGeneratedKeys(); 
            if(n==1)
            {
                keys.next(); 
                int key = keys.getInt(1);
                return key;
            }
            else
            {
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating :"+e);
            return 0;
        }
     }
     
     
     public boolean updateHospital(int id,String name,String address,String mobno){
         try {
            pst=con.prepareStatement("update hospital set name=?,address=?,mobile=? where id=?");
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setString(3, mobno);
            pst.setInt(4, id);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
     }
     
     public ResultSet getUsers()
    {
        try {
            pst=con.prepareStatement("select * from user");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
     public ResultSet getHospitals()
    {
        try {
            pst=con.prepareStatement("select * from hospital");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
      public ResultSet getCampByHospitalId(int hid)
    {
        try {
            pst=con.prepareStatement("select * from camp where hospital_id="+hid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
      
       public ResultSet getCamp()
    {
        try {
            pst=con.prepareStatement("select * from camp order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }  
      
       public ResultSet getCampDonersByCampId(int cid)
    {
        try {
            pst=con.prepareStatement("select * from camp_donor where camp_id="+cid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
      
        public ResultSet getuserqueries()
    {
        try {
            pst=con.prepareStatement("select * from user_queries order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
     public int update_delete(String sql){
        try {
            pst=con.prepareStatement(sql);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 2;
        }
    }
     
     public ResultSet getBloodRequestByUserId(int userid)
    {
        
        try {
            pst=con.prepareStatement("select * from blood_request where user_id="+userid);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    public ResultSet getBloodRequest()
    {
        
        try {
            pst=con.prepareStatement("select * from blood_request");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
      public Boolean addBloodRequest(int userid,String bgroup,String mobile,String location)
    {
        try {
            pst=con.prepareStatement("insert into blood_request (user_id,bgroup,mobile,location,status) values(?,?,?,?,?)");
            pst.setInt(1, userid);
            pst.setString(2, bgroup);
            pst.setString(3, mobile);
            pst.setString(4, location);
            pst.setInt(5, 1);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
      
       public Boolean addUserQuery(String query,int uid)
    {
        try {
            pst=con.prepareStatement("insert into user_queries (query,user_id) values(?,?)");
            pst.setString(1, query);
            pst.setInt(2, uid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
      
      public Boolean addCampDonor(String userid,String address,String mobile,String bgroup,String campid)
    {
        try {
            pst=con.prepareStatement("insert into camp_donor (camp_id,user_id,address,mobile,bgroup) values(?,?,?,?,?)");
            pst.setString(1, campid);
            pst.setString(2, userid);
            pst.setString(3, address);
            pst.setString(4, mobile);
            pst.setString(5, bgroup);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
     
    
    public boolean updateStatus(int id,int status,String tab){
        try {
            pst=con.prepareStatement("update "+tab+" set status="+status+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public int getUserPoints(int uid){
        try {
            pst=con.prepareStatement("select count(*) as point from camp_donor where user_id="+uid);
            rs=pst.executeQuery();
            rs.next();
            int point=rs.getInt("point");
            pst=con.prepareStatement("select count(*) as mpoint from blood_request where status=1 and user_id="+uid);
            rs=pst.executeQuery();
            rs.next();
            int mpoint=rs.getInt("mpoint");
            
            return point-mpoint;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
   
    
    public int getBloodGroupsWithUnits(int hid){
        try {
            
            pst=con.prepareStatement("select * from camp where hospital_id="+hid);
            rs=pst.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id");
                PreparedStatement pst1=con.prepareStatement("select * from camp_donor where camp_id="+id);
                ResultSet rs1=pst1.executeQuery();
                while(rs1.next()){
                    String bgroup=rs1.getString("bgroup");
                   
                }
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
        return 0;
    }
    
     public ResultSet selectAll(String q)
    {
        
        try {
            pst=con.prepareStatement(q);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
     
     public String checkUserEmailExist(String email)
    {
        try {
            pst=con.prepareStatement("select * from user where email='"+email+"' and status=1");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("mobile");
            }
            else
            {
                return "";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return "";
        }
    }
     
     public String checkHospitalEmailExist(String email)
    {
        try {
            pst=con.prepareStatement("select * from hospital where email=? and status=1");
            pst.setString(1, email);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getString("mobile");
            }
            else
            {
                return null;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
    

    
}

