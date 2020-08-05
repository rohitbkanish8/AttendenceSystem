<%-- 
    Document   : Course
    Created on : Feb 7, 2020, 11:33:39 PM
    Author     : Rohit B. Kanish
--%>

 
 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<select id="course" class="form-control">

        <option>Select Course...</option> 
<%
      try 
        {
             
            String department=request.getParameter("department");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement ps = con.prepareStatement("select * from at_course where dept_id = ?");
            ps.setString(1,department);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
%>
<option value="<%=rs.getString("course_id")%>"> <%=rs.getString("course_name")%></option>
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
 

