<%-- 
    Document   : Updateadmin
    Created on : Mar 6, 2020, 10:52:29 PM
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
            int id=Integer.parseInt(request.getParameter("edit_id"));
            String name=request.getParameter("edit_name");
            String usr=request.getParameter("edit_usrname");
            String pass=request.getParameter("edit_pass");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement st = con.prepareStatement("UPDATE at_admin SET admin_name='"+name+"',admin_username='"+usr+"',admin_password='"+pass+"' WHERE id='"+id+"'");
            int rs = st.executeUpdate();
                if(rs>0){
                    out.println("Update Admin Successfully");
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
