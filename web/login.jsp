<%-- 
    Document   : login
    Created on : Mar 9, 2020, 10:29:44 PM
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
            int user=Integer.parseInt(request.getParameter("user"));
            String uname=request.getParameter("uname");
            String name="";
            String tid="";
            String pass=request.getParameter("pass");
            out.println(uname+"  "+pass);
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            if(user==1){
                out.println("sdkkj");
                PreparedStatement st = con.prepareStatement("SELECT * FROM at_admin WHERE admin_username ='"+uname+"' and admin_password ='"+pass+"'");
                ResultSet rs = st.executeQuery();
                if(rs.next()){
                    name= rs.getString("admin_name");
                    session= request.getSession();
                    session.setAttribute("username", name);
                    out.println("Login Successful");
                    response.sendRedirect("dashboard.jsp");
                }
                else{ 
                        out.println("Invalid Username and Password");
                        response.sendRedirect("index.jsp");                    
                }
            }
            else if(user==2){
                PreparedStatement st = con.prepareStatement("SELECT * FROM at_teacher WHERE t_username ='"+uname+"' and t_password ='"+pass+"'");
                ResultSet rs = st.executeQuery();
                out.println("SELECT * FROM at_teacher WHERE t_username ='"+uname+"' and t_password ='"+pass+"'");
                if(rs.next()){
                    name= rs.getString("t_name");
                    tid=rs.getString("t_id");
                    session= request.getSession();
                    session.setAttribute("username", name);
                    session.setAttribute("teacherid", tid);
                    out.println("Login Successful");
                    response.sendRedirect("TodayWork.jsp");
                }
                else{ 
                        out.println("Invalid Username and Password");
                        response.sendRedirect("index.jsp");                    
                }
                con.close();
                }
            }
            catch(Exception e){
                out.println(e.getMessage());
            }
        
        %>
        
    </body>
</html>

