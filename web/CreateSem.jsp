<%-- 
    Document   : CreateSem
    Created on : Feb 24, 2020, 9:33:24 PM
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
        <title>Semester</title>
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
                            <a class="nav-link text-white" href="SubjectAllocation.jsp" role="tab">Subject Allocation</a>
                          </div>                        
                        <a class="nav-link text-white" href="CreateStudent.jsp">Student Master</a>
                        <a class="nav-link text-white" href="Timetable.jsp">Time Table</a>
                        <a class="nav-link text-white" href="CreateDepartment.jsp">Department</a>
                        <a class="nav-link text-white" href="CreateCourse.jsp">Course</a>
                        <a class="nav-link text-white active" href="CreateSem.jsp">Semester</a>
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
                    
                    <h2 class="mt-4 ml-5">SEMESTER</h2>     
                    
                    <!--div class="col-lg-6 m-4 border border-warning p-2 mx-auto">
                        <h3 class="bg-white text-dark p-1">Create New Semester</h3>
                        <form>
                            <div class="row ml-auto text-center">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Select Department: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="dept" name="dept">
                                    <option>Select Department...</option>
                            </select>
                            </div>
                            </div>
                            <div class="row ml-auto text-center mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Select Course: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="course" name="course">
                                    <option>Select Course...</option>
                            </select>
                            </div>
                            </div>
                            <div class="row ml-auto text-center mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Enter Semester: </label>
                            </div>
                            <div class="col-lg-6">
                            <input class="form-control float-left" type="text" placeholder="Semester"/>
                            </div>
                            </div>
                            <div class="row mx-auto mt-2">
                            <div class="col-lg-12 text-center">
                            <button class="btn btn-success" type="submit">Create Course</button>
                            </div>
                            </div>
                        </form>
                    </div-->
                    <div>
                    <div class="row mt-4 ml-4">
                        <div class="col-lg-6">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                        </div>
                        <div class="col-lg-6 text-right ml-auto pr-5">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                        Add Semester
                        </button>
                        </div>
                    </div>                    
                    
                    <div class="container mt-2">
                        <table class="table border table-hover table-responsive text-center">
                            <thead class="bg-dark text-white">
                              <tr>
                                <th>Semester id</th>
                                <th>Course Name</th>
                                <th>Semester Name</th>
                                <th colspan="2">Action</th>
                              </tr>
                            </thead>
                            <tbody class="font-weight-bold bg-primary">
                                <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
                                    PreparedStatement ps = con.prepareStatement("SELECT s.sem_id,s.semester_name,s.course_id,s.dept_id,c.course_name FROM at_semester s JOIN at_course c on s.course_id = c.course_id");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                              <tr>
                                <td><input class="font-weight-bold text-center w-25" value="<%=rs.getString("sem_id")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center w-50" value="<%=rs.getString("course_name")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center w-25" value="<%=rs.getString("semester_name")%>" style="border: hidden;" readonly></td>
                                <!--td><button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModalView">
                        <i class="fa fa-eye"></i> View </button></td-->
                                <td><button type="button" class="btn btn-success getid" data-toggle="modal" data-course="<%=rs.getString("course_id")%>" data-dept="<%=rs.getString("dept_id")%>" data-name="<%=rs.getString("semester_name")%>" data-id="<%=rs.getString("sem_id")%>" data-target="#exampleModalEdit">
                        <i class="fa fa-edit"></i> Edit </button></td>
                                <td><button type="button" class="btn btn-danger delid" data-toggle="modal" data-id="<%=rs.getString("sem_id")%>" data-target="#exampleModalDelete">
                        <i class="fa fa-close"></i> Delete </button></td>
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
                              <!--tr>
                                <td>101</td>
                                <td>Marry</td>
                                <td>John</td>
                                <td><a class="btn btn-light" href=""><i class="fa fa-eye"></i> View</a></td>
                                <td><a class="btn btn-success" href=""><i class="fa fa-edit"></i> Edit</a></td>
                                <td><a class="btn btn-danger" href=""><i class="fa fa-close"></i> Delete</a></td>
                              </tr--> 
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Create New Semester    </h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/InsertSem.jsp">
                            <div class="row ml-auto text-center">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Select Department: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="dept" name="dept">
                                    <option>Select Department...</option>                                  
                                   <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
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
                            </div>
                            <div class="row ml-auto text-center mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Select Course: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="course" name="course">
                                    <option>Select Course...</option>
                            </select>
                            </div>
                            </div>
                            <div class="row ml-auto text-center mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Enter Semester: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" name="newsem" type="text" placeholder="Semester"/>
                            </div>
                            </div>
                        <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Create Semester</button>                                
                            </div>
                            </form>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal fade" id="exampleModalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalEditTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Edit Semester</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Updatesem.jsp">
                            <div class="row mi-auto text-center d-none">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">ID:</label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="editid" name="editid" type="text" placeholder="ID"/>
                            </div>
                            </div>
                            <div class="row ml-auto text-center">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Select Department: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="editdept" name="editdept">
                                    <option>Select Department...</option>                                  
                                   <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
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
                            </div>
                            <div class="row ml-auto text-center mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Select Course: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="editcourse" name="editcourse">
                                    <option>Select Course...</option>  
                                    <%
                                    try {
                                    Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
                                    PreparedStatement ps = con.prepareStatement("select * from at_course");
                                    ResultSet rs = ps.executeQuery();

                                while(rs.next()){
                                %>
                                <option value="<%=rs.getString("course_id")%>"><%=rs.getString("course_name")%></option>
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
                            </div>
                            <div class="row ml-auto text-center mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Enter Semester: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="editsem" name="editsem" type="text" placeholder="Semester"/>
                            </div>
                            </div>
                        <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" id="editdeptbtn" class="btn btn-primary">Update Department</button>                                
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Delete Semester</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Deletesem.jsp">
                            <div class="row mi-auto text-center d-none">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletesem" name="deletesem" type="text" value="" placeholder="ID" readonly/>
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
            $(document).on("click", ".getid", function () {
            var SemID = $(this).data('id');
            $(".modal-body #editid").val( SemID );
            var Semname = $(this).data('name');
            $(".modal-body #editsem").val( Semname );
            var c_id = $(this).data('course');
            $(".modal-body #editcourse").val( c_id );
            var d_id = $(this).data('dept');
            $(".modal-body #editdept").val( d_id );
       });
            $(document).on("click", ".delid", function () {
            var C_ID = $(this).data('id');
            $(".modal-body #deletesem").val( C_ID );
       }); 
        </script>
        <script>
            $(document).ready(function(){  
                                        $('#dept').change(function(){  //alert($("#dept").val());                           
                                           var dept=$("#dept").val(); 
                                           $.post("Course.jsp",{department:dept},function(data,status){
                                             $("#course").html(data);
            
                                           });
                                        });
            });
        </script>
    </body>
</html>

