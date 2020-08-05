<%-- 
    Document   : FUnction
    Created on : Mar 4, 2020, 11:04:33 AM
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
        <title>Attendence List</title>
        <link rel="stylesheet" href="cssfiles/bootstrap.min.css">
        <link rel="stylesheet" href="cssfiles/style.css">
        <link rel="stylesheet" href="cssfiles/stylemenu.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jsfiles/slim.min.js"></script>
        <script src="jsfiles/menujs.js"></script>
        <script src="jsfiles/popper.min.js"></script>
        <script src="jsfiles/bootstrap.min.js"></script>
        <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>
        <script src="jsfiles/jquery-3.3.1.min.js"></script>
        
        <style>
            body{
                background-image: url("images/blue.jpg");
                background-attachment: fixed;
                background-size: 100% 100%;
            } 
 
        </style>
    </head>
    <body>
        <header class="text-white text-center p-4 border-bottom" style="background-color: #111;">
            <div>
                <h1>ATTENDANCE SYSTEM</h1>
            </div>
        </header>
            <div class="row container-fluid">
                
                <div class="col-lg-12 text-white">
                    <div id="mySidebar" class="sidebar">
                        <div class="border border-white rounded bg-light text-dark p-1">
                            <img src="images/avatar1.png" height="25%" width="25%"> <span class="font-weight-bold">Hello ${username}</span>
                        </div>
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a class="nav-link text-white" href="dashboard.jsp">Dashboard</a>
                        <a class="nav-link text-white active" href="CreateAdmin.jsp">Admin</a>
                        <button class="dropdown-btn text-white">Teacher Master
                            <i class="fa fa-caret-down p-2"></i>
                          </button>
                          <div class="dropdown-container">
                            <a class="nav-link text-white" href="teacher.jsp" role="tab">Teacher</a>
                            <a class="nav-link text-white" href="SubjectAllocation.jsp" role="tab">Subject Allocation</a>
                          </div>                        
                        <a class="nav-link text-white" href="CreateStudent.jsp">Student Master</a>
                        <a class="nav-link text-white" href="Timetable.jsp">Time Table</a>
                        <a class="nav-link text-white" href="CreateDepartment.jsp">Department</a>
                        <a class="nav-link text-white" href="CreateCourse.jsp">Course</a>
                        <a class="nav-link text-white" href="CreateSem.jsp">Semester</a>
                        <a class="nav-link text-white" href="CreateSec.jsp">Section</a>
                        <a class="nav-link text-white" href="AttendenceList.jsp" role="tab">Attendance Master</a>
                        <a class="nav-link text-white" href="logout.jsp" role="tab">Log Out</a>
                        <!--a href="#">About</a>
                        <a href="#">Services</a>
                        <a href="#">Clients</a>
                        <a href="#">Contact</a-->
                      </div>
                    <div id="main">
                        <button class="openbtn" onclick="openNav()" ondblclick="closeNav()">&#9776; Menu</button> 
                      <h2 class="mt-4 ml-5">EDIT ATTENDANCE</h2> 
              
        <div class="container font-weight-bold mt-4 p-4 text-white">
            <div class="p-4">                
                
                      <%
      try 
        {
            String tbl=request.getParameter("tbl");
            String atd=request.getParameter("atd");
//            out.println(tbl);
//            out.println(atd);
            int x=1;
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
            PreparedStatement ps = con.prepareStatement("select name,roll_no,"+atd+" from "+tbl+"");
            ResultSet rs = ps.executeQuery();
            %>
            
            <form action="Admin/UpdateStuAttendence.jsp" method="get"><!-- onSubmit="return createList();"-->
                <div class="container p-2 ml-auto bg-dark"><label class="" style="font-size: 1.5rem;">Date: </label>
                    <input type="text" class="border border-dark rounded" style="height: 3rem;font-size: 1.5rem;" name="dates" value="<%=atd%>" readonly>
                    <input type="hidden" name="table" value="<%=tbl%>" readonly>
                </div>
                <!--input type="text" name="dates" value="<!%=col%>" readonly=""-->
                <div id="table_rows">    
                <table id="student_det" class="table border table-hover table-responsive-sm text-center">
                  <thead class="bg-white text-dark">
                    <tr>
                      <th>Sr. No.</th>
                      <th>Roll No.</th>
                      <th>Name</th>
                      <th><button type="button" class="btn btn-primary btn-sm checks">P</button></th>
                    </tr>
                  </thead>
                  <tbody class="font-weight-bold bg-success">
            <%
            while(rs.next()){
            %>
            <tr>                  
            <td value=""> <%out.println(x);%></td>
            <td id="inputroll" class="w-25"><input name="roll_<%=x%>" class="font-weight-bold" value="<%=rs.getString("roll_no")%>" style="border: hidden;" readonly></td>
            <td> <input class="font-weight-bold" name="<%=rs.getString("name")%>" value="<%=rs.getString("name")%>" style="border: hidden;" readonly></td>
            <td class="text-center" id="checkinput" value=""> <input name="boxes_<%=x%>" style="width: 1.5rem; height: 1.5rem;" class="check" id="boxes_<%out.println(x);%>" type="checkbox" <% 
            if ("on".equals(rs.getString(atd))) {
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
                  </script>                  
    </body>
</html>
