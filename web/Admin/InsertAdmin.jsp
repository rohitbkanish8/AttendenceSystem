<%-- 
    Document   : InsertAdmin
    Created on : Mar 6, 2020, 10:34:58 PM
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
            String name=request.getParameter("adm_name");
            String usr=request.getParameter("adm_usrname");
            String pass=request.getParameter("adm_pass");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement st = con.prepareStatement("INSERT INTO at_admin (admin_name,admin_username,admin_password) VALUES('"+name+"','"+usr+"','"+pass+"')");
            int rs = st.executeUpdate();
                if(rs>0){
                    out.println("Add Admin Successfully");
                    response.sendRedirect("../CreateAdmin.jsp");
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

