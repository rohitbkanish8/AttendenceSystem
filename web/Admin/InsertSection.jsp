<%-- 
    Document   : InsertSection
    Created on : Mar 7, 2020, 12:54:25 PM
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
            try
            {
            String sec=request.getParameter("newsec");
            int sem=Integer.parseInt(request.getParameter("sem"));
            int dept=Integer.parseInt(request.getParameter("dept"));
            int course=Integer.parseInt(request.getParameter("course"));
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement st = con.prepareStatement("INSERT INTO at_section (section_name,sem_id,course_id,dept_id) VALUES('"+sec+"','"+sem+"','"+course+"','"+dept+"')");
            int rs = st.executeUpdate();
                if(rs>0){
                    out.println("Add Section Successfully");
                    response.sendRedirect("../CreateSec.jsp");
                }
                else{ 
                        out.println("Insertion fails");
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
