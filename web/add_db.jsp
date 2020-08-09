<%-- 
    Document   : add_db
    Created on : Mar 24, 2020, 3:09:23 PM
    Author     : Rohit B. Kanish
--%>

<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            try{
            String table=request.getParameter("table_name");
            out.println(table);
            String[] a={};
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement st = con.prepareStatement("SELECT * FROM upload_timetable where table_name='"+table+"'");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
               String ab = rs.getString("value");//out.println("bdjbdj");
               a=ab.split("#"); 
               //out.println(rs.getString("value"));
               
            }//out.println(a);
            for(int i=0;i<a.length;i++){
                String[] data=a[i].split(",");
                out.println(data[0]+" "+data[1]+" "+data[2]+" "+data[3]+" "+data[4]+" "+data[5]+" "+data[6]+" "+data[7]+" "+data[8]+" "+data[9]+" "+data[10]+" "+data[11]+" "); //+" "+data[7]+" "+data[8]+" "+data[9]+" "+data[10]+" "+data[11]+" "
                //out.println("INSERT INTO ut_timetable VALUES('"+data[0]+"','"+data[1]+"','"+data[2]+"','"+data[3]+"','"+data[4]+"','"+data[5]+"','"+data[6]+"','"+data[7]+"','"+data[8]+"','"+data[9]+"','"+data[10]+"','"+data[11]+"')");
                Connection conn = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
                PreparedStatement stm = conn.prepareStatement("INSERT INTO ut_timetable VALUES('"+data[0]+"','"+data[1]+"','"+data[2]+"','"+data[3]+"','"+data[4]+"','"+data[5]+"','"+data[6]+"','"+data[7]+"','"+data[8]+"','"+data[9]+"','"+data[10]+"','"+data[11]+"')");//,'"+data[7]+"','"+data[8]+"','"+data[9]+"','"+data[10]+"','"+data[11]+"'
                int s=stm.executeUpdate();
                if(s>0){
                    out.println("successful");
                }
            }
            }
            catch(Exception e){
                e.printStackTrace();
            }
        %>
    </body>
</html>
