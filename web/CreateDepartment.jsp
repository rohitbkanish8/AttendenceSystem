<%-- 
    Document   : dashboard
    Created on : Feb 24, 2020, 7:43:22 PM
    Author     : Rohit B. Kanish
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="Adminpanel.Department" %>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department</title>
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
                        <a class="nav-link text-white active" href="CreateDepartment.jsp">Department</a>
                        <a class="nav-link text-white" href="CreateCourse.jsp">Course</a>
                        <a class="nav-link text-white" href="CreateSem.jsp">Semester</a>
                        <a class="nav-link text-white" href="CreateSec.jsp">Section</a>
                        <a class="nav-link text-white" href="AttendenceList.jsp" role="tab">Attendance Master</a>
                        <a class="nav-link text-white" href="logout.jsp" role="tab">Log Out</a>
                      </div>

                    <div id="main">
                        <button class="openbtn" onclick="openNav()" ondblclick="closeNav()">&#9776; Menu</button> 
                      <h2 class="mt-4 ml-5">DEPARTMENT</h2> 
                   
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
                        Add Department
                        </button>
                        </div>
                    </div>                   
                    
                    <div class="container mt-2">
                        <table class="table border table-hover table-responsive-sm text-center">
                            <thead class="bg-dark text-white">
                              <tr>
                                <th>Department id</th>
                                <th>Department Name</th>
                                <th colspan="2">Action</th>
                              </tr>
                            </thead>
                            <tbody class="font-weight-bold bg-primary">
                            <%
                            try 
                            {   Class.forName("com.mysql.jdbc.Driver"); 
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                PreparedStatement ps = con.prepareStatement("select * from at_department");
                                ResultSet rs = ps.executeQuery();
                                
                            
                            while(rs.next()){
                            %>
                            <tr>
                                <td><input class="font-weight-bold text-center w-25" value="<%=rs.getString("dept_id")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("dept_name")%>" style="border: hidden;" readonly></td>
                                <td><button type="button" class="btn btn-success getid" data-toggle="modal" data-name="<%=rs.getString("dept_name")%>" data-id="<%=rs.getString("dept_id")%>" data-target="#exampleModalEdit">
                        <i class="fa fa-edit"></i> Edit </button></td>
                                <td><button type="button" class="btn btn-danger delid" data-toggle="modal" data-id="<%=rs.getString("dept_id")%>" data-target="#exampleModalDelete">
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
                            </tbody>
                          </table>
                              
                    </div>
                </div>
        </div></div>
        </div>
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Add New Department</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/InsertDept.jsp">
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Department Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" name="newdept" id="newdept" type="text" placeholder="Department"/>
                            </div>
                            </div> 
                            <div class="modal-footer mt-3">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" id="newdeptbtn" class="btn btn-primary newdeptbtn">Create Department</button>         
                                <!--onclick="insertdept()"-->                    
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Edit Department</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Updatedept.jsp">
                            <div class="row mi-auto text-center d-none">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">ID:</label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="editid" name="editid" type="text" placeholder="Department"/>
                            </div>
                            </div>
                            <div class="row mi-auto text-center">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Enter Department Name: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="editdept" name="editdept" type="text" placeholder="Department"/>
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
                      <h5 class="modal-title" id="exampleModalLongTitle">Delete Department</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/Deletedept.jsp">
                            <div class="row mi-auto text-center d-none">
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">ID: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="deletedept" name="deletedept" type="text" value="" placeholder="ID" readonly/>
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
            var DeptID = $(this).data('id');
            $(".modal-body #editid").val( DeptID );
            var Deptname = $(this).data('name');
            $(".modal-body #editdept").val( Deptname );
       });
           $(document).on("click", ".delid", function () {
            var DeptID = $(this).data('id');
            $(".modal-body #deletedept").val( DeptID );
       }); 
        </script>
    </body>
</html>
