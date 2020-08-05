<%-- 
    Document   : tables
    Created on : Mar 3, 2020, 12:16:44 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<select id="attend" class="form-control">

        <option>Select Date...</option> 
<%
      try 
        {
             
            String today=request.getParameter("today");
            String yesterday=request.getParameter("yesterday");
//            int dept=Integer.parseInt(request.getParameter("dept"));
//            int course=Integer.parseInt(request.getParameter("course"));
//            int sem=Integer.parseInt(request.getParameter("sem"));
//            int sec=Integer.parseInt(request.getParameter("sec"));
            String subject=request.getParameter("sub");
            String course=request.getParameter("course");
//            int subject=Integer.parseInt(request.getParameter("sub"));
            Object n=session.getAttribute("teacherid");
            String nam=n.toString();
            String name=nam.replaceAll("-","");
            String table="";
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement stm = con.prepareStatement("SELECT * FROM at_attendence where tbl_name like '"+name+"_"+course+"%"+subject+"'");
            ResultSet rs1 = stm.executeQuery();
            while(rs1.next()){
                table= rs1.getString("tbl_name");
            }out.println(table);
            PreparedStatement ps = con.prepareStatement("SELECT column_name FROM information_schema.columns WHERE table_schema = 'attendence' AND  table_name = '"+table+"' AND column_name like '"+today+"%' OR column_name like '"+yesterday+"%'");//"+today+"  "+yesterday+"
           // ps.setString(1,department);
            out.print(ps);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
%>
<option value="<%=rs.getString("column_name")%>"> <%=rs.getString("column_name")%></option>
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
 


