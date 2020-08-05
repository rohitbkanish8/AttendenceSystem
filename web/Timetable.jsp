<%-- 
    Document   : Timetable
    Created on : Mar 24, 2020, 1:46:40 PM
    Author     : Rohit B. Kanish
--%>

<%-- 
    Document   : CreateStudent
    Created on : Mar 8, 2020, 8:18:34 PM
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
        <title>Timetable</title>
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
        
<!--        <script>
                $(document).ready(function(){
                    $("form").submit(function(event){
                        event.preventDefault();
                        var formData = new FormData();
                        $.ajax({
                            url: "upload",
                            type: 'POST',
                            data: formData,
                            success: function(data) {
                                window.alert(data);
                               
                            },
                            cache: false,
                            contentType: false,
                            processData: false
                        });
                    });
                });
        </script>-->
        
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
                        <a class="nav-link text-white active" href="CreateAdmin.jsp">Admin</a>
                        <button class="dropdown-btn text-white">Teacher Master
                            <i class="fa fa-caret-down p-2"></i>
                          </button>
                          <div class="dropdown-container">
                            <a class="nav-link text-white" href="teacher.jsp" role="tab">Teacher</a>
                            <a class="nav-link text-white" href="SubjectAllocation.jsp" role="tab">Subject Allocation</a>
                          </div>                        
                        <a class="nav-link text-white" href="CreateStudent.jsp">Student Master</a>
                        <a class="nav-link text-white active" href="Timetable.jsp">Time Table</a>
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
                      <h2 class="mt-4 ml-5">TIME TABLE</h2> 
                   
                    <div>
                    <div class="row mt-4 ml-4">
                        <div class="col-lg-6 col-sm-5">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                        </div>
                        <div class="col-lg-6 text-right col-sm-5 ml-auto pr-5">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                        Upload CSV 
                        </button>
                        </div>
                    </div> 
                </div>
        </div></div>
        </div>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Upload Timetable</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form ENCTYPE="multipart/form-data" ACTION="UploadData" METHOD="post">           <!--upload_page.jsp-->                
                            
                            <div class="row mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Choose the file To Upload:</label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" name="file" type="file"/>
                            </div>
                            </div>
                        <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Upload</button>                                
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Edit Admin</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Updateadmin.jsp">
                            <div class="row mi-auto">
                            <div class="col-lg-6 d-none">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6 d-none">
                                <input class="form-control float-left" id="edit_id" name="edit_id" type="text" placeholder="Admin"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Admin Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_name" name="edit_name" type="text" placeholder="Admin"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter User_Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_usrname" name="edit_usrname" type="text" placeholder="admin"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Password: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_pass" name="edit_pass" type="text" placeholder="Password"/>
                            </div>
                            </div>                            
                        <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Update Admin</button>                                
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Delete Admin</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Deleteadmin.jsp">
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6 d-none">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6 d-none">
                                <input class="form-control float-left" id="deleteadmin" name="deleteadmin" type="text" value="" placeholder="ID" readonly/>
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
            var name = $(this).data('name');
            $(".modal-body #edit_name").val( name );
            var usr = $(this).data('usr');
            $(".modal-body #edit_usrname").val( usr );
            var pass = $(this).data('pass');
            $(".modal-body #edit_pass").val( pass );
       });
            $(document).on("click", ".delid", function () {
            var ID = $(this).data('id');
            $(".modal-body #deleteadmin").val( ID );
       }); 
        </script>
        
    </body>
</html>


