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
        <link rel="stylesheet" href="cssfiles/datatables.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jsfiles/slim.min.js"></script>
        <script src="jsfiles/menujs.js"></script>
        <script src="jsfiles/popper.min.js"></script>
        <script src="jsfiles/bootstrap.min.js"></script>
        <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>
        <script src="jsfiles/jquery-3.3.1.min.js"></script>
        <script src="jsfiles/datatables.min.js"></script>
        
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
                <div class="container mt-2">
                    <table class="table table-fluid text-center" id="myTable">
                            <thead class="bg-dark text-white">
                              <tr>
                                <th>Teacher id</th>
                                <th>Day</th>
                                <th>Course</th>
                                <th>Time</th>
                                <th colspan="2">Action</th>
                              </tr>
                            </thead>
                            <tbody class="font-weight-bold bg-primary">
                                <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                    PreparedStatement ps = con.prepareStatement("SELECT * FROM ut_timetable");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                              <tr>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("t_id")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("day")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("course")%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold text-center" value="<%=rs.getString("start_at")%>" style="border: hidden;" readonly></td>
                                <!--td><button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModalView">
                        <i class="fa fa-eye"></i> View </button></td-->
                                <td><button type="button" class="btn btn-success getid" data-toggle="modal">
                        <i class="fa fa-edit"></i> Edit </button></td>
                                <td><button type="button" class="btn btn-danger delid" data-toggle="modal">
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
        </div></div>
        </div>

        <script>
            $(document).ready( function () {
                $('#myTable').DataTable();
            } );
        </script>
    </body>
</html>


