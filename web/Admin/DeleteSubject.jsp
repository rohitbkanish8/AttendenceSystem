<%-- 
    Document   : DeleteSubject
    Created on : Mar 7, 2020, 11:36:37 PM
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
            int id=Integer.parseInt(request.getParameter("deleteid"));
            String sname=request.getParameter("deletename");
            String tname=request.getParameter("deletetname");
            String course=request.getParameter("deletecourse");
            String sem=request.getParameter("deletesem");
            String dept=request.getParameter("deletedept").replaceAll(" ","");
            String sec=request.getParameter("deletesec");
            String table=tname+"_"+dept+"_"+course+"_"+sem+"_"+sec+"_"+sname;
            out.println(sname);
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement st = con.prepareStatement("DELETE from at_subject WHERE sub_id='"+id+"'");
            int rs = st.executeUpdate();
            PreparedStatement stm= con.prepareStatement("DROP TABLE "+table+"");
            int rs1 = stm.executeUpdate();
                if(rs>0){
                    out.println("Delete Section Successfully");
                    response.sendRedirect("../SubjectAllocation.jsp");
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


