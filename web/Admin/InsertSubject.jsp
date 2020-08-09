<%-- 
    Document   : InsertSubject
    Created on : Mar 7, 2020, 8:08:39 PM
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
            String subject=request.getParameter("subject");
            int sem=Integer.parseInt(request.getParameter("sem"));
            int sec=Integer.parseInt(request.getParameter("section"));
            int dept=Integer.parseInt(request.getParameter("dept"));
            int course=Integer.parseInt(request.getParameter("course"));
            int teacher=Integer.parseInt(request.getParameter("teacher"));
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            PreparedStatement st = con.prepareStatement("INSERT INTO at_subject (sub_name,t_id,dept_id,course_id,sem_id,sec_id) VALUES('"+subject+"','"+teacher+"','"+dept+"','"+course+"','"+sem+"','"+sec+"')");
            int rs = st.executeUpdate();
            PreparedStatement stm = con.prepareStatement("SELECT c.course_name, s.semester_name, d.dept_name, sc.section_name, t.t_name FROM at_semester s,at_department d,at_course c,at_teacher t,at_section sc WHERE c.course_id='"+course+"' AND s.sem_id='"+sem+"' AND t.id='"+teacher+"' AND d.dept_id='"+dept+"' AND sc.sec_id='"+sec+"' ");
            ResultSet rs1 = stm.executeQuery();
            String table="";
            String tch="";
            String sec_name="";
            while(rs1.next()){
                sec_name=rs1.getString("section_name");
                table= rs1.getString("dept_name").replaceAll(" ","")+"_"+rs1.getString("course_name")+"_"+rs1.getString("semester_name");
                tch= rs1.getString("t_name")+"_"+rs1.getString("dept_name").replaceAll(" ","")+"_"+rs1.getString("course_name")+"_"+rs1.getString("semester_name")+"_"+rs1.getString("section_name")+"_"+subject;
            }//out.println(table);out.println(tch);
            PreparedStatement stmt = con.prepareStatement("CREATE TABLE "+tch+" (id int(10) PRIMARY KEY AUTO_INCREMENT,roll_no int(10),name varchar(100))");
            //out.println("CREATE TABLE '"+tch+"' (id int(10) PRIMARY KEY AUTO_INCREMENT,roll_no int(10) UNIQUE,name varchar(100))");
            int rs2 = stmt.executeUpdate();
            PreparedStatement stmnt = con.prepareStatement("SELECT * FROM "+table+" WHERE section='"+sec_name+"'");
            ResultSet rs3 = stmnt.executeQuery();
            while(rs3.next()){
               PreparedStatement stmnts = con.prepareStatement("INSERT INTO "+tch+" VALUES ('"+rs3.getString("id")+"','"+rs3.getString("roll_no")+"','"+rs3.getString("name")+"')"); 
               int s= stmnts.executeUpdate();
            }
                if(rs>0){
                    out.println("Add Section Successfully");
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
