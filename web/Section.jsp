<%-- 
    Document   : Section
    Created on : Feb 8, 2020, 12:16:56 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<select id="section" class="form-control">

        <option>Select Section...</option> 
<%
      try 
        {
             
            String sem=request.getParameter("sem");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement ps = con.prepareStatement("select * from at_section where sem_id = ?");
            ps.setString(1,sem);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
%>
<option value="<%=rs.getString("sec_id")%>"> <%=rs.getString("section_name")%></option>
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
 


