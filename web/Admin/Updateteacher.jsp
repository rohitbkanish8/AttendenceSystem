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
            int id=Integer.parseInt(request.getParameter("edit_id"));
            String t_id=request.getParameter("edit_tid");
            String name=request.getParameter("edit_name");
            String dept=request.getParameter("edit_dept");
            String des=request.getParameter("edit_des");
            String usr=request.getParameter("edit_usr");
            String pass=request.getParameter("edit_pass");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement st = con.prepareStatement("UPDATE at_teacher SET t_id='"+t_id+"',t_name='"+name+"',t_design='"+des+"',t_dept='"+dept+"',t_username='"+usr+"',t_password='"+pass+"' WHERE id='"+id+"'");
            int rs = st.executeUpdate();
                if(rs>0){
                    out.println("Update Semester Successfully");
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
