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
        <title>Dashboard</title>
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
                        <a class="nav-link text-white active" href="dashboard.jsp">Dashboard</a>
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
        
                    <h2 class="mt-4 ml-5">DASHBOARD</h2>
                    <div class="row">
                    <%
                    try{
                        Class.forName("com.mysql.jdbc.Driver"); 
                        Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
                        PreparedStatement st = con.prepareStatement("SELECT COUNT(*) AS admin FROM at_admin");
                        PreparedStatement stm = con.prepareStatement("SELECT COUNT(*) AS teachers FROM at_teacher");
                        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS dept FROM at_department");
                        PreparedStatement stmnt = con.prepareStatement("SELECT COUNT(*) AS course FROM at_course");
                        ResultSet rs = st.executeQuery();
                        while(rs.next())
                        {
                    %>
                    <div class="card col-lg-5 bg-dark h-50 mt-4 ml-5">
                        <div class="card-body d-flex">
                            <div class="card-icon pt-4">
                                <i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>
                            </div>
                            <div class="card-label text-right ml-auto mt-2" style="font-size: 1.5rem;">
                                <span style="font-size: 1.5rem;">Admin</span>
                                <br>
                                <span class="p-4" style="font-size: 2rem;"><%=rs.getString("admin")%></span>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                        ResultSet rs1 = stm.executeQuery();
                        while(rs1.next())
                        {
                    %>
                    <div class="card col-lg-5 bg-dark h-50 mt-4 ml-5">
                        <div class="card-body d-flex">
                            <div class="card-icon pt-4">
                                <i class="fa fa-user-plus fa-5x" aria-hidden="true"></i>
                            </div>
                            <div class="card-label text-right ml-auto mt-2" style="font-size: 1.5rem;">
                                <span style="font-size: 1.5rem;">Teachers</span>
                                <br>
                                <span class="p-4" style="font-size: 2rem;"><%=rs1.getString("teachers")%></span>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                        ResultSet rs2 = stmt.executeQuery();
                        while(rs2.next())
                        {
                    %>
                    <div class="card col-lg-5 bg-dark h-50 mt-4 ml-5">
                        <div class="card-body d-flex">
                            <div class="card-icon pt-4">
                                <i class="fa fa-cube fa-5x" aria-hidden="true"></i>
                            </div>
                            <div class="card-label text-right ml-auto mt-2" style="font-size: 1.5rem;">
                                <span style="font-size: 1.5rem;">Departments</span>
                                <br>
                                <span class="p-4" style="font-size: 2rem;"><%=rs2.getString("dept")%></span>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                        ResultSet rs3 = stmnt.executeQuery();
                        while(rs3.next())
                        {
                    %>
                    <div class="card col-lg-5 bg-dark h-50 mt-4 ml-5">
                        <div class="card-body d-flex">
                            <div class="card-icon pt-4">
                                <i class="fa fa-cubes fa-5x" aria-hidden="true"></i>
                            </div>
                            <div class="card-label text-right ml-auto mt-2" style="font-size: 1.5rem;">
                                <span style="font-size: 1.5rem;">Course</span>
                                <br>
                                <span class="p-4" style="font-size: 2rem;"><%=rs3.getString("course")%></span>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    }
                    catch(Exception e){
                        out.println(e.getMessage());
                    }
                    %>
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

    </body>
</html>
