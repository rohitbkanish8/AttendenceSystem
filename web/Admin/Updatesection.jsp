<%-- 
    Document   : Updatesection
    Created on : Mar 7, 2020, 2:07:50 PM
    Author     : Rohit B. Kanish
--%>

<%-- 
    Document   : InsertDept
    Created on : Mar 5, 2020, 7:03:12 PM
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
            int id=Integer.parseInt(request.getParameter("editid"));
            String sec=request.getParameter("editsec");
            int dept=Integer.parseInt(request.getParameter("editdept"));
            int sem=Integer.parseInt(request.getParameter("editsem"));
            int course=Integer.parseInt(request.getParameter("editcourse"));
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement st = con.prepareStatement("UPDATE at_section SET section_name='"+sec+"',sem_id='"+sem+"',course_id='"+course+"',dept_id='"+dept+"' WHERE sec_id='"+id+"'");
            int rs = st.executeUpdate();
                if(rs>0){
                    out.println("Update Section Successfully");
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

