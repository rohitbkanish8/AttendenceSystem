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
            String t_id=request.getParameter("t_id");
            String t_name=request.getParameter("t_name");
            String t_dept=request.getParameter("t_dept");
            String t_des=request.getParameter("t_des");
            String t_usr=request.getParameter("t_usr");
            String t_pass=request.getParameter("t_pass");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement st = con.prepareStatement("INSERT INTO at_teacher (t_id,t_name,t_dept,t_design,t_username,t_password) VALUES ('"+t_id+"','"+t_name+"','"+t_dept+"','"+t_des+"','"+t_usr+"','"+t_pass+"')");
            int rs = st.executeUpdate();
                if(rs>0){
                    out.println("Add Teacher Successfully");
                    response.sendRedirect("../teacher.jsp");
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
