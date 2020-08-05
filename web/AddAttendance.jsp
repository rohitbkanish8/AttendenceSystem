<%-- 
    Document   : AddAttendance
    Created on : Mar 18, 2020, 9:58:20 PM
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
        <link rel="stylesheet" href="cssfiles/bootstrap.min.css">
        <link rel="stylesheet" href="cssfiles/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jsfiles/slim.min.js"></script>
        <script src="jsfiles/popper.min.js"></script>
        <script src="jsfiles/bootstrap.min.js"></script>
        <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>
        <script src="jsfiles/jquery-3.3.1.min.js"></script>
        <title>Add Attendance Page</title>
        <style>
            body{
                background-image: url("images/ptrn1.jpg");
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,no-revalidate");
            
            if(session.getAttribute("username")==null && session.getAttribute("teacherid")==null)
                response.sendRedirect("index.jsp");
        %>
        <header class="headnav font-weight-bold p-2">
            <nav class="navbar navbar-expand-lg navbar-dark fixed">
                <a class="navbar-brand" href="#">Hello ${username}</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link mr-2 active" href="TodayWork.jsp">Add Attendance</a>
                    <!--<a class="nav-item nav-link" href="AttendencePage.jsp">Add Attendance <span class="sr-only">(current)</span></a>-->
                    <a class="nav-item nav-link mr-2" href="EditAttendanceWork.jsp">Edit Attendance</a>
                    <a class="nav-item nav-link mr-2" href="ViewAttendanceWork.jsp">View Attendance</a>
                    <a class="nav-item nav-link border rounded bg-white text-dark mr-2" href="logout.jsp"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i> Logout</a>
                  </div>
<!--                    <div class="nav-item">
                          <a href="logout.jsp"><button type="button" class="btn btn-light btn-block"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i><span class="text-dark font-weight-bold">  LogOut</span></button></a>
                    </div>-->
                </div>
              </nav>
        </header>
                
        <section class="container mt-4 table-responsive-sm">
            <h3>STUDENT'S ATTENDANCE</h3>
            <div class="">                
                
                      <%
            try 
              {             
            String table=request.getParameter("table");
            Class.forName("com.mysql.jdbc.Driver");             
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            String btn_val=request.getParameter("add_attend");
            PreparedStatement ps = con.prepareStatement("select name,roll_no from "+table);
            ResultSet rs = ps.executeQuery();//out.println(rs);
            //String x,y;
            int x=1;
            DateFormat df = new SimpleDateFormat("dd_MMM_yy_HH_mm_ss");
            String formattedDate = df.format(new Date());
            DateFormat df1 = new SimpleDateFormat("dd-MMM-yy HH:mm:ss");
            String formattedDate1 = df1.format(new Date());
            //out.println(formattedDate);
            %>
            
            <form action="Teacher/StuAttendance.jsp" method="post" onsubmit="myfunction()" id="student-form"><!-- onSubmit="return createList();"-->
                <div class="container p-2 ml-auto bg-dark" style="border-radius: 10px;overflow: hidden;">
                    <label class="text-white font-weight-bold">Date: </label>
                    <input type="hidden" class="border border-dark rounded" style="height: 3rem;font-size: 1.5rem;" name="dates" value="<%=formattedDate%>" readonly>
                    <input type="hidden" name="table" value="<%=table%>" readonly>
                    <input type="hidden" name="add_attend" value="<%=btn_val%>" readonly>
                    <input type="text" class="border border-dark rounded font-weight-bold" name="datess" value="<%=formattedDate1%>" readonly>
                </div>
                <div id="table_rows ">    
                    <table id="student_det" class="table table-bordered table-responsive-lg p-0" style="border-radius: 10px;overflow: hidden;">
                  <thead class="text-white headnav text-center">
                    <tr>
                      <th>Sr. No.</th>
                      <th>Roll No.</th>
                      <th>Name</th>
                      <th><button style="background-color: #c01432;" type="button" class="btn text-white btn-sm checks font-weight-bold">P</button></th>
                    </tr>
                  </thead>
                  <tbody class="bg-white text-center text-dark">
                    <%
                    while(rs.next()){
                    %>
                    <tr>                  
                    <td class="font-weight-bold" value=""> <%out.println(x);%></td>
                    <td id="inputroll" class="w-25"><input name="roll_<%=x%>" class="" value="<%=rs.getString("roll_no")%>" style="border: hidden;" readonly></td>
                    <td class="font-weight-bold" value="<%=rs.getString("name")%>"> <%=rs.getString("name")%></td>

                    <!--td value="<!%out.print(date.toString());%>"> <!%out.print(date.toString());%></td-->
                    <td class="text-center" id="checkinput" value=""> <input name="boxes_<%=x%>" style="width: 1.2rem; height: 1.2rem;" class="check" id="boxes_<%out.println(x);%>" type="checkbox"></td>
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
                  <input type="hidden" id="checkedboxvalue">
                  </tbody>
                </table> 
                </div>
                <div>
                    <button type="submit" class="btn btn-md headnav text-white font-weight-bold" onmouseover="return createList();">Submit Attendance</button>     
                </div>  
                    <input type="hidden" name="hide" id="hide">    
                </form>
            </div>
        </section>
                  <script type="text/javascript">
                                    $(document).ready(function(){  
                                    $('.checks').click(function () {
                                       $('input[class=check]').prop("checked", true);
                                    });
                                    $('.checks').dblclick(function () {
                                       $('input[class=check]').prop("checked", false);
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
                          alert("No. of Students: "+check+"/"+total+"\nAttendance Added Successfully");
                        }
                  </script>
                  <script>// to calculate number of checkboxes checked
                      $(document).ready(function(){
                            var $checkboxes = $('#student-form td input[type="checkbox"]');

                            $checkboxes.change(function(){
                                var countCheckedCheckboxes = $checkboxes.filter(':checked').length;

                                $('#checkedboxvalue').val(countCheckedCheckboxes);
                            });
                            $('.checks').click(function () {
                                $('input[class=check]').prop("checked", true);
                                var countCheckedCheckboxes = $checkboxes.filter(':checked').length;

                                $('#checkedboxvalue').val(countCheckedCheckboxes);
                            });
                            $('.checks').dblclick(function () {
                                $('input[class=check]').prop("checked", false);
                                var countCheckedCheckboxes = $checkboxes.filter(':checked').length;

                                $('#checkedboxvalue').val(countCheckedCheckboxes);
                            });
                        });
                  </script>
    </body>
</html>

