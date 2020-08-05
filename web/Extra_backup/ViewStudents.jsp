<%-- 
    Document   : ViewStudents
    Created on : Mar 11, 2020, 8:18:59 PM
    Author     : Rohit B. Kanish
--%>

<%-- 
    Document   : Students
    Created on : Feb 24, 2020, 11:38:46 AM
    Author     : Rohit B. Kanish
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.rmi.CORBA.Stub"%>
<%@page import="Student.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
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
        <title>Student Attendance</title>
        <link rel="stylesheet" href="cssfiles/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jsfiles/slim.min.js"></script>
        <script src="jsfiles/popper.min.js"></script>
        <script src="jsfiles/bootstrap.min.js"></script>
        <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>
        <script src="jsfiles/jquery-3.3.1.min.js"></script>
        <style>
            body{
                background-image: url("images/p2.jpg");
                background-attachment: fixed;
                background-size: 100% 100%;
            } 
 
        </style>
    </head>
    <body class="">
        <div class="container-fluid font-weight-bold fixed bg-dark text-white">
                <h1 class="text-center p-2">ATTENDANCE MANAGEMENT</h1>
                <nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="#">Hello ${username}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
        <a class="nav-item nav-link" href="AttendencePage.jsp">Add Attendance <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="EditAttendencePage.jsp">Edit Attendance</a>
      <a class="nav-item nav-link active" href="ViewAttendencePage.jsp">View Attendance</a>
    </div>
      <div class="nav-item ml-auto p-2">
            <a href="logout.jsp"><button type="button" class="btn btn-light btn-block"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i><span class="text-dark font-weight-bold">  LogOut</span></button></a>
      </div>
  </div>
</nav>
        </div>
        <div class="container font-weight-bold mt-4 p-4 text-white">
            <h3>VIEW STUDENT'S ATTENDANCE</h3>
            <div class="p-4">                
                
                      <%
      try 
        {
             
            int dept=Integer.parseInt(request.getParameter("dept"));
            int course=Integer.parseInt(request.getParameter("course"));
            int sem=Integer.parseInt(request.getParameter("sem"));
            int sec=Integer.parseInt(request.getParameter("section"));
            String teacher=request.getParameter("teacher");
            int subject=Integer.parseInt(request.getParameter("subject"));
            String table="";
            Class.forName("com.mysql.jdbc.Driver");             
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement stm = con.prepareStatement("SELECT c.course_name, s.semester_name, d.dept_name, sc.section_name, sb.sub_name FROM at_semester s,at_department d,at_course c,at_section sc,at_subject sb WHERE c.course_id='"+course+"' AND s.sem_id='"+sem+"' AND d.dept_id='"+dept+"' AND sc.sec_id='"+sec+"' AND sb.sub_id='"+subject+"' ");
            ResultSet rs1 = stm.executeQuery();
            while(rs1.next()){
                table= teacher+"_"+rs1.getString("dept_name").replaceAll(" ","")+"_"+rs1.getString("course_name")+"_"+rs1.getString("semester_name")+"_"+rs1.getString("section_name")+"_"+rs1.getString("sub_name");
            }//out.println(table);
            PreparedStatement ps = con.prepareStatement("select * from "+table);
            ResultSet rs = ps.executeQuery();//out.println(rs);
            //String x,y;
            int x=1;
            DateFormat df = new SimpleDateFormat("dd_MMM_yy_HH_mm_ss");
            String formattedDate = df.format(new Date());
            DateFormat df1 = new SimpleDateFormat("dd-MMM-yy HH:mm:ss");
            String formattedDate1 = df1.format(new Date());
            //out.println(formattedDate);
            %>
            
            <form action="ViewStuAttendance.jsp" method="get"><!-- onSubmit="return createList();"-->
                <div class="container p-2 ml-auto bg-dark"><label class="" style="font-size: 1.5rem;">Date: </label>
                    <input type="hidden" class="border border-dark rounded" style="height: 3rem;font-size: 1.5rem;" name="dates" value="<%=formattedDate%>" readonly>
                    <input type="hidden" name="table" value="<%=table%>" readonly>
                    <input type="text" class="border border-dark rounded" style="height: 3rem;font-size: 1.5rem;" name="datess" value="<%=formattedDate1%>" readonly>
                </div>
                <div id="table_rows">    
                    <table id="student_det" class="table table-bordered table-responsive-lg table-hover p-0">
                  <thead class="text-white bg-success text-center">
                      <%
                            PreparedStatement ps1 = con.prepareStatement("SELECT column_name FROM information_schema.columns WHERE table_schema = 'attendence' AND  table_name = '"+table+"' ");//"+today+"  "+yesterday+"
                            // ps.setString(1,department);
                             //out.print(ps);
                             ResultSet rst = ps1.executeQuery();
                             int last=0;
                      %>
                    <tr>
                        <%
                            while (rst.next()) { 
                        %>
                      <th><%=rst.getString("column_name")%></th>
                      <%
                          last++;
                          }
                      %>
                    </tr>
<!--                  <input type="text" value="<%=last%>">-->
                  </thead>
                  <tbody class="bg-white text-center text-dark">
            <%
            while(rs.next()){
            %>
            <tr>                  
            <td value=""> <%out.println(x);%></td>
            <td id="inputroll" class="w-25"><input name="roll_<%=x%>" class="font-weight-bold" size="5" value="<%=rs.getString("roll_no")%>" style="border: hidden;" readonly></td>
            <td value="<%=rs.getString("name")%>"> <%=rs.getString("name")%></td>
            <%for (int i = 4; i <= last; i++) { 
                String present ="";
               if(rs.getString(i).equals("null")){
                   present ="A";
            %>
                    <td class="text-danger" value="<%=present%>"> <%=present%></td> 
            <%
               } 
               else{
                   present ="P";
            %>            
                    <td class="text-success" value="<%=present%>"> <%=present%></td> 
            <%        
                }
              }  
            %>
            </tr>
            <%
             x++;
            }
            con.close();
            
              } catch (ClassNotFoundException e) {
                     e.printStackTrace();
              } catch (SQLException e) {
                     e.printStackTrace();
            }
      
%>
                  </tbody>
                </table> 
                </div>
                <!--div>
                    <button type="submit" class="btn btn-primary btn-md" onmouseover="return createList();">Submit Attendance</button>     
                </div-->  
                    <input type="hidden" name="hide" id="hide">    
                </form>
            </div>
        </div>
                  <script type="text/javascript">
                                    $(document).ready(function(){  
                                    $('.checks').click(function () {
                                       $('input[class=check]').prop("checked", true);
                                    });
                                    $('#boxes').click(function () {
                                       $('input[class=check]').prop("checked", false);
                                    });
                                    });
                  </script> 
                  <script>
                      function createList(){
                          var prodTable = document.getElementById('student_det');
                          var x= prodTable.rows.length;
                          document.getElementById("hide").value= x;
                        }
                  </script>
    </body>
</html>

