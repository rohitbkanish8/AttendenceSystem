<%-- 
    Document   : EditStudents
    Created on : Mar 1, 2020, 3:55:42 PM
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
    <body class="bg-dark">
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
      <a class="nav-item nav-link active" href="EditAttendencePage.jsp">Edit Attendance</a>
      <a class="nav-item nav-link" href="ViewAttendencePage.jsp">View Attendance</a>
    </div>
      <div class="nav-item ml-auto p-2">
            <a href="logout.jsp"><button type="button" class="btn btn-light btn-block"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i><span class="text-dark font-weight-bold">  LogOut</span></button></a>
      </div>
  </div>
</nav>
        </div>
        <div class="container font-weight-bold mt-4 p-4 text-white">
            <h3>EDIT STUDENT'S ATTENDANCE</h3>
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
            String col=request.getParameter("attend");
            Class.forName("com.mysql.jdbc.Driver"); 
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement stm = con.prepareStatement("SELECT c.course_name, s.semester_name, d.dept_name, sc.section_name, sb.sub_name FROM at_semester s,at_department d,at_course c,at_section sc,at_subject sb WHERE c.course_id='"+course+"' AND s.sem_id='"+sem+"' AND d.dept_id='"+dept+"' AND sc.sec_id='"+sec+"' AND sb.sub_id='"+subject+"' ");
            ResultSet rs1 = stm.executeQuery();
            while(rs1.next()){
                table= teacher+"_"+rs1.getString("dept_name").replaceAll(" ","")+"_"+rs1.getString("course_name")+"_"+rs1.getString("semester_name")+"_"+rs1.getString("section_name")+"_"+rs1.getString("sub_name");
            }//out.println(table);
            PreparedStatement ps = con.prepareStatement("select name,roll_no,"+col+" from "+table+"");
            ResultSet rs = ps.executeQuery();
            //String x,y;
            int x=1;
            DateFormat df = new SimpleDateFormat("dd_MMM_yy");
            String formattedDate = df.format(new Date());
            //out.println(formattedDate);
            %>
            
            <form action="EditStuAttendence.jsp" method="post" id="student-form" onsubmit="myfunction()"><!-- onSubmit="return createList();"-->
                <div class="container p-2 ml-auto bg-dark"><label class="" style="font-size: 1.5rem;">Date: </label>
                    <input type="text" class="border border-dark rounded" style="height: 3rem;font-size: 1.5rem;" name="dates" value="<%=col%>" readonly>
                    <input type="hidden" name="table" value="<%=table%>" readonly>
                </div>
                <!--input type="text" name="dates" value="<!%=col%>" readonly=""-->
                <div id="table_rows">    
                <table id="student_det" class="table table-bordered table-responsive-md bg-white table-hover p-0">
                  <thead class="text-white bg-success text-center">
                    <tr>
                      <th>Sr. No.</th>
                      <th>Roll No.</th>
                      <th>Name</th>
                      
                      <th><button type="button" class="btn btn-primary btn-sm checks">P</button></th>
                    </tr>
                  </thead>
                  <tbody class="bg-white text-center text-dark">
            <%
            while(rs.next()){
            %>
            <tr>                  
            <td value=""> <%out.println(x);%></td>
            <td id="inputroll" class="w-25"><input name="roll_<%=x%>" class="font-weight-bold" value="<%=rs.getString("roll_no")%>" style="border: hidden;" readonly></td>
            <td value="<%=rs.getString("name")%>"> <%=rs.getString("name")%></td>
            
            <!--td value="<!%out.print(date.toString());%>"> <!%out.print(date.toString());%></td-->
            <td class="text-center" id="checkinput" value=""> <input name="boxes_<%=x%>" style="width: 1.5rem; height: 1.5rem;" class="check" id="boxes_<%out.println(x);%>" type="checkbox" <% 
            if ("on".equals(rs.getString(col))) {
                out.print("checked=\"checked\"");
            } %>/></td>
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
<input type="text" id="checkedboxvalue">
                  </tbody>
                </table> 
                </div>
                <div>
                    <button type="submit" class="btn btn-primary btn-md" onmouseover="return createList();">Edit Attendance</button>     
                </div>  
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
                      function myfunction(){
                          var total=document.getElementById("hide").value-1;
                          var check=document.getElementById("checkedboxvalue").value;
                          alert("No. of Students: "+check+"/"+total+"\nAttendance Edited Successfully");
                        }
                  </script>
                  <script>
                      $(document).ready(function(){
                            var $checkboxes = $('#student-form td input[type="checkbox"]');

                            $checkboxes.change(function(){
                                var countCheckedCheckboxes = $checkboxes.filter(':checked').length;

                                $('#checkedboxvalue').val(countCheckedCheckboxes);
                            });

                        });
                  </script>
    </body>
</html>
