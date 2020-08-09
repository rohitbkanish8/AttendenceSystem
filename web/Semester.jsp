<%-- 
    Document   : Semester
    Created on : Feb 8, 2020, 12:02:49 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<select id="sem" class="form-control">

        <option>Select Semester...</option> 
<%
      try 
        {
             
            String course=request.getParameter("course");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement ps = con.prepareStatement("select * from at_semester where course_id = ?");
            ps.setString(1,course);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
%>
<option value="<%=rs.getString("sem_id")%>"> <%=rs.getString("semester_name")%></option>
<%
            }
            con.close();
            
              } catch (ClassNotFoundException e) {
                     e.printStackTrace();
              } catch (SQLException e) {
                     e.printStackTrace();
            }
%>
</select>
 


