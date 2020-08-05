<%-- 
    Document   : subject
    Created on : Mar 19, 2020, 6:10:18 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<select id="subject" class="form-control">

        <option>Select Subject...</option> 
<%
      try 
        {
            String course=request.getParameter("course");
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
           
            PreparedStatement ps = con.prepareStatement("Select distinct subject,subject_as from at_timetable where course='"+course+"' and t_id='"+session.getAttribute("teacherid")+"'");
           // ps.setString(1,department);
            out.print(ps);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
%>
<option value="<%=rs.getString("subject_as")%>"> <%=rs.getString("subject")%></option>
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
 


