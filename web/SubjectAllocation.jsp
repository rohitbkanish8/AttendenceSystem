<%-- 
    Document   : SubjectAllocation
    Created on : Mar 6, 2020, 11:02:20 PM
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
        <title>Subject Allocation</title>
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
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,no-revalidate");
            
            if(session.getAttribute("username")==null)
                response.sendRedirect("index.jsp");
        %>
        <!--jsp:include page="/header.jsp" /-->
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
                        <a class="nav-link text-white" href="CreateAdmin.jsp">Admin</a>
                        <button class="dropdown-btn text-white">Teacher Master 
                            <i class="fa fa-caret-down p-2"></i>
                          </button>
                          <div class="dropdown-container">
                            <a class="nav-link text-white" href="teacher.jsp" role="tab">Teacher</a>
                            <a class="nav-link text-white active" href="SubjectAllocation.jsp" role="tab">Subject Allocation</a>
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
                    <h2 class="mt-4 ml-5">SUBJECT ALLOCATION</h2>
                    <div class="row">
                    <div class="col-lg-5 mt-4 ml-4">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                    <div class="col-lg-5 mt-4 ml-auto text-right pr-5">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                        Add Subject
                        </button>
                    </div>
                    </div>
                    <div class="container mt-2">
                        <table class="table border table-hover table-responsive text-center">
                            <thead class="bg-dark text-white">
                              <tr>
                                <th>ID</th>
                                <th>Subject Name</th>
                                <th>Teacher Name</th>
                                <th>Course</th>
                                <th>Semester</th>
                                <th>Action</th>
                              </tr>
                            </thead>
                            <tbody class="font-weight-bold bg-primary">
                                <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                    PreparedStatement ps = con.prepareStatement("SELECT s.*,t.t_name,c.course_name,sem.semester_name,d.dept_name,sec.section_name FROM at_subject s JOIN at_teacher t ON s.t_id= t.id JOIN at_course c ON s.course_id= c.course_id JOIN at_semester sem ON s.sem_id= sem.sem_id JOIN at_department d ON s.dept_id= d.dept_id JOIN at_section sec ON s.sec_id= sec.sec_id");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                              <tr>
                                  <td><input class="font-weight-bold text-center w-50" value="<%=rs.getString("sub_id")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("sub_name")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("t_name")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("course_name")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("semester_name")%>" style="border: hidden;" readonly></td>
                                <td><button type="button" class="btn btn-danger delid" data-toggle="modal" data-id="<%=rs.getString("sub_id")%>" data-sec="<%=rs.getString("section_name")%>" data-dept="<%=rs.getString("dept_name")%>" data-sname="<%=rs.getString("sub_name")%>" data-tname="<%=rs.getString("t_name")%>" data-course="<%=rs.getString("course_name")%>" data-sem="<%=rs.getString("semester_name")%>" data-target="#exampleModalDelete">
                        <i class="fa fa-close"> Delete </i></button></td>
                              </tr> 
                              <%
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
                </div>
        </div>
        </div>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Add Subject</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/InsertSubject.jsp">
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Select Department: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="dept" name="dept">
                                    <option>Select Department...</option>
                                    <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                    PreparedStatement ps = con.prepareStatement("select * from at_department");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                                <option value="<%=rs.getString("dept_id")%>"><%=rs.getString("dept_name")%></option>
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
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Select Course: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="course" name="course">
                                    <option>Select Course...</option>
                            </select>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Select Semester: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="sem" name="sem">
                                    <option>Select Semester...</option>
                            </select>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Select Section: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="section" name="section">
                                    <option>Select Section...</option>
                            </select>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Select Teacher: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="teacher" name="teacher">
                                    <option>Select Teacher...</option>
                                    <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                    PreparedStatement ps = con.prepareStatement("select * from at_teacher");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                                <option value="<%=rs.getString("id")%>"><%=rs.getString("t_name")%></option>
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
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Subject: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="subject" name="subject" type="text" placeholder="Subject"/>
                            </div>                            
                            </div> 
                            <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Create Teacher</button>                                
                            </div>
                            </form>
                    </div>
                  </div>
                </div>
              </div>
        
            <div class="modal fade" id="exampleModalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalDeleteTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Delete Subject</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/DeleteSubject.jsp">
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deleteid" name="deleteid" type="text" value="" placeholder="ID" readonly/>
                            </div>
                            
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Subject Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletename" name="deletename" type="text" value="" placeholder="ID" readonly/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Teacher Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletetname" name="deletetname" type="text" value="" placeholder="ID" readonly/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Course Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletecourse" name="deletecourse" type="text" value="" placeholder="ID" readonly/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Department Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletedept" name="deletedept" type="text" value="" placeholder="ID" readonly/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Semester Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletesem" name="deletesem" type="text" value="" placeholder="ID" readonly/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Section Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletesec" name="deletesec" type="text" value="" placeholder="ID" readonly/>
                            </div>
                            </div>
                            <div class="row mi-auto text-center">
                            <div class="col-lg-12">
                                <h4>Are you sure you want to DELETE?</h4>
                            </div>
                            </div>
                        <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                <button type="submit" class="btn btn-danger">Yes</button>                                
                            </div>
                            </form>
                    </div>
                  </div>
                </div>
              </div>
        <!--jsp:include page="/footer.jsp" /-->
        <script>
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;

            for (i = 0; i < dropdown.length; i++) {
              dropdown[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                  dropdownContent.style.display = "none";
                } else {
                  dropdownContent.style.display = "block";
                }
              });
            }
        </script>
        <script>
            $(document).on("click", ".delid", function () {
            var ID = $(this).data('id');
            $(".modal-body #deleteid").val( ID );
            var sname = $(this).data('sname');
            $(".modal-body #deletename").val( sname );
            var tname = $(this).data('tname');
            $(".modal-body #deletetname").val( tname );
            var course = $(this).data('course');
            $(".modal-body #deletecourse").val( course );
            var sem = $(this).data('sem');
            $(".modal-body #deletesem").val( sem );
            var dept = $(this).data('dept');
            $(".modal-body #deletedept").val( dept );
            var sec = $(this).data('sec');
            $(".modal-body #deletesec").val( sec );
       });
        </script>
        <script>
            $(document).ready(function(){  
                                        $('#dept').change(function(){  //alert($("#dept").val());                           
                                           var dept=$("#dept").val(); 
                                           $.post("Course.jsp",{department:dept},function(data,status){
                                              // alert(data);
                                             $("#course").html(data);
            
                                           });
                                        });
                                        $('#course').change(function(){  //alert($("#course").val());                           
                                           var course=$("#course").val();
                                           $.post("Semester.jsp",{course:course},function(data,status){
                                             $("#sem").html(data);
            
                                           });
                                        });
                                        $('#sem').change(function(){  //alert($("#sem").val());                           
                                           var sem=$("#sem").val(); 
                                           $.post("Section.jsp",{sem:sem},function(data,status){
                                             $("#section").html(data);
            
                                           });
                                        });
            });
        </script>
    </body>
</html>

