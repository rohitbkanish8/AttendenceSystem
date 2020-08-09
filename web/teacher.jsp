<%-- 
    Document   : dashboard
    Created on : Feb 21, 2020, 4:14:22 PM
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
        <title>Teacher</title>
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
                            <a class="nav-link text-white active" href="teacher.jsp" role="tab">Teacher</a>
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
                    <h2 class="mt-4 ml-5">TEACHERS</h2>
                    <div class="row">
                    <div class="col-lg-5 mt-4 ml-4">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                    <div class="col-lg-5 mt-4 ml-auto text-right pr-5">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                        Add Teacher
                        </button>
                    </div>
                    </div>
                    <div class="container mt-2">
                        <table class="table border table-hover table-responsive-lg text-center">
                            <thead class="bg-dark text-white">
                              <tr>
                                <th rowspan="2">ID</th>
                                <!--th rowspan="2">Teacher id</th-->
                                <th rowspan="2">Teacher Name</th>
                                <th rowspan="2">Teacher Department</th>
                                <th rowspan="2">Username</th>
                                <th colspan="3">Action</th>
                              </tr>
                              <tr>                                
                                <th>View</th>
                                <th>Edit</th>
                                <th>Delete</th>
                              </tr>
                            </thead>
                            <tbody class="font-weight-bold bg-primary">
                                <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
                                    PreparedStatement ps = con.prepareStatement("SELECT t.*,d.dept_name FROM at_teacher t JOIN at_department d on t.t_dept = d.dept_id");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                              <tr>
                                  <td><input class="font-weight-bold text-center w-50" value="<%=rs.getString("id")%>" style="border: hidden;" readonly></td>
                                <!--td><input class="font-weight-bold text-center" value="<%=rs.getString("t_id")%>" style="border: hidden;" readonly></td-->
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("t_name")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("dept_name")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("t_username")%>" style="border: hidden;" readonly></td>
                                <td><button type="button" class="btn btn-light getid" data-toggle="modal" data-id="<%=rs.getString("id")%>" data-pass="<%=rs.getString("t_password")%>" data-dept="<%=rs.getString("t_dept")%>" data-usr="<%=rs.getString("t_username")%>" data-tdesig="<%=rs.getString("t_design")%>" data-tname="<%=rs.getString("t_name")%>" data-tid="<%=rs.getString("t_id")%>" data-target="#exampleModalView">
                        <i class="fa fa-eye"></i></button></td>
                                <td><button type="button" class="btn btn-success getid" data-toggle="modal" data-id="<%=rs.getString("id")%>" data-pass="<%=rs.getString("t_password")%>" data-dept="<%=rs.getString("t_dept")%>" data-usr="<%=rs.getString("t_username")%>" data-tdesig="<%=rs.getString("t_design")%>" data-tname="<%=rs.getString("t_name")%>" data-tid="<%=rs.getString("t_id")%>" data-target="#exampleModalEdit">
                        <i class="fa fa-edit"></i></button></td>
                                <td><button type="button" class="btn btn-danger delid" data-toggle="modal" data-id="<%=rs.getString("id")%>" data-target="#exampleModalDelete">
                        <i class="fa fa-close"></i></button></td>
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
                                <td>Business Administration</td>
                                <td><a class="btn btn-light" href=""><i class="fa fa-eye"></i> View</a></td>
                                <td><a class="btn btn-info" href=""><i class="fa fa-edit"></i> Edit</a></td>
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Create New Teacher</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/InsertTeacher.jsp">
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher ID: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="t_id" name="t_id" type="text" placeholder="ROH-123"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="t_name" name="t_name" type="text" placeholder="Name"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Select Teacher Department: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="t_dept" name="t_dept">
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
                            <!--div class="col-lg-6">
                                <input class="form-control float-left" id="t_dept" type="text" placeholder="Department"/>
                            </div-->
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher Designation: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="t_des" name="t_des" type="text" placeholder="Designmation"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Username: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="t_usr" name="t_usr" type="text" placeholder="Username"/>
                            </div><div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Password: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="t_pass" name="t_pass" type="password" placeholder="Password"/>
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
        <div class="modal fade" id="exampleModalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalEditTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Edit Teacher/<h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Updateteacher.jsp">
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6 d-none">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6 d-none">
                                <input class="form-control float-left" id="edit_id" name="edit_id" type="text" placeholder="Id"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher ID: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_tid" name="edit_tid" type="text" placeholder="ROH-123"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_name" name="edit_name" type="text" placeholder="Name"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher Department: </label>
                            </div>
                            <div class="col-lg-6">
                                <select class="form-control" id="edit_dept" name="edit_dept">
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
                            <label class="text-dark font-weight-bold">Enter Teacher Designation: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_des" name="edit_des" type="text" placeholder="Designmation"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Username: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_usr" name="edit_usr" type="text" placeholder="Username"/>
                            </div><div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Password: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_pass" name="edit_pass" type="text" placeholder="Password"/>
                            </div>
                            </div>                            
                        <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Update Teacher</button>                                
                            </div>
                            </form>
                    </div>
                  </div>
                </div>
              </div>
        <div class="modal fade" id="exampleModalView" tabindex="-1" role="dialog" aria-labelledby="exampleModalViewTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">View Teacher</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="">
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6 d-none">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6 d-none">
                                <input class="form-control float-left" id="view_id" type="text" placeholder="Id"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher ID: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="view_tid" type="text" placeholder="ROH-123"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="view_name" type="text" placeholder="Name"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Teacher Department: </label>
                            </div>
                            <div class="col-lg-6">
                                <select class="form-control" id="view_dept" name="view_dept">
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
                            <label class="text-dark font-weight-bold">Enter Teacher Designation: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="view_des" type="text" placeholder="Designmation"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Username: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="view_usr" type="text" placeholder="Username"/>
                            </div><div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Password: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="view_pass" type="text" placeholder="Password"/>
                            </div>
                            </div>                            
                        <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <!--button type="submit" class="btn btn-primary">Create Department</button-->                                
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Delete Teacher</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Deleteteacher.jsp">
                            <div class="row mi-auto text-center d-none">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deleteteach" name="deleteteach" type="text" value="" placeholder="ID" readonly/>
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
            var ID = $(this).data('id');
            $(".modal-body #edit_id").val( ID );
            $(".modal-body #view_id").val( ID );
            var tid = $(this).data('tid');
            $(".modal-body #edit_tid").val( tid );
            $(".modal-body #view_tid").val( tid );
            var tname = $(this).data('tname');
            $(".modal-body #edit_name").val( tname );
            $(".modal-body #view_name").val( tname );
            var dept = $(this).data('dept');
            $(".modal-body #edit_dept").val( dept );
            $(".modal-body #view_dept").val( dept );
            var tdesig = $(this).data('tdesig');
            $(".modal-body #edit_des").val( tdesig );
            $(".modal-body #view_des").val( tdesig );
            var usr = $(this).data('usr');
            $(".modal-body #edit_usr").val( usr );
            $(".modal-body #view_usr").val( usr );
            var pass = $(this).data('pass');
            $(".modal-body #edit_pass").val( pass );
            $(".modal-body #view_pass").val( pass );
       });
            $(document).on("click", ".delid", function () {
            var id = $(this).data('id');
            $(".modal-body #deleteteach").val( id );
       }); 
        </script>
    </body>
</html>
