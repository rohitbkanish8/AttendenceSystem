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
            String course=request.getParameter("newcourse");
            int dept=Integer.parseInt(request.getParameter("dept"));
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement st = con.prepareStatement("INSERT INTO at_course (course_name,dept_id) VALUES('"+course+"','"+dept+"')");
            int rs = st.executeUpdate();
                if(rs>0){
                    out.println("Add Course Successfully");
                    response.sendRedirect("../CreateCourse.jsp");
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
