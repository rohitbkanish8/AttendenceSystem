<%-- 
    Document   : UpdateStuAttendence
    Created on : Mar 9, 2020, 6:29:30 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
            int v=Integer.parseInt(request.getParameter("hide"));
            int x;
            String dates=request.getParameter("dates");
            String table=request.getParameter("table");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
              Statement ps = con.createStatement();
            //String sql =" ALTER TABLE satya_attendence ADD COLUMN ("+dates+" varchar(10) default 'null')";
            int rs1 =0;
            out.println(ps);
            for(int i=1;i<v;i++)
            {
                String checkbox= "boxes_"+i;
                String inputval= "roll_"+i;
            String tblname=String.valueOf(request.getParameter(checkbox));
            int roll=Integer.parseInt(request.getParameter(inputval));
            out.println(tblname);out.println(roll);
//            if(tblname=="on"){
//                x=1;
//            }
//            else{
//                x=0;
//            }out.println(x);
            Statement ps1 = con.createStatement();
            String sql1 ="UPDATE "+table+" SET "+dates+"='"+tblname+"' WHERE roll_no="+roll;
            out.println(sql1);
            rs1 = ps1.executeUpdate(sql1);
            }
            
            if(rs1>0){
                    out.println("Update Attendence Successfully");
                    response.sendRedirect("../AttendenceList.jsp");
                }
                else{ 
                        out.println("Attendence  fails");
                        //response.sendRedirect("index.jsp");                    
                }
                con.close();
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
        
        %>
        
    </body>
</html>

