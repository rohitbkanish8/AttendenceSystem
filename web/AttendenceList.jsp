<%-- 
    Document   : AttendenceList
    Created on : Mar 9, 2020, 4:53:49 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance List</title>
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
                <header class="text-white text-center p-4 border-bottom fixed" style="background-color: #111;">
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
                      <h2 class="mt-4 ml-5">ATTENDANCE LIST</h2> 
                   
                    <div>
                    <div class="row mt-4 ml-4">
                        <div class="col-lg-3 col-sm-5">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" size="10" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                        </div>
                        <div class="col-lg-9 text-right col-sm-5 ml-auto pr-5">
                            <form class="form-inline my-2 my-lg-0" action="SelectedAttendenceList.jsp">
                            <select class="form-control mr-sm-2 col-lg-6" name="table_name">
                            <option>Select table...</option>
                            <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                    PreparedStatement ps = con.prepareStatement("select distinct tbl_name from at_attendence");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                                <option value="<%=rs.getString("tbl_name")%>"><%=rs.getString("tbl_name")%></option>
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
                                <input type="date" name="selectdate" id="selectdate" value="02_Mar_20" class="form-control mr-sm-2 col-lg-3">
                                <input type="hidden" name="seldate" id="seldate">
                                <input type="submit" class="btn btn-primary" value="Find Results">
                        </form>
                        </div>
                    </div> 
                </div>
                                    <div class="container mt-2">
                        <table class="table border table-hover table-responsive-sm text-center">
                            <thead class="bg-dark text-white">
                              <tr>
                                <th>S.No.</th>
                                <th>Table</th>
                                <th>Attendance Date</th>
                                <th>Action</th>
                              </tr>
                            </thead>
                            <tbody class="font-weight-bold bg-primary">
                            <%
                            try 
                            {   Class.forName("com.mysql.jdbc.Driver"); 
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                DateFormat df = new SimpleDateFormat("dd_MMM_yy");
                                String dated = df.format(new Date());
                                //out.println(dated);
                                PreparedStatement ps = con.prepareStatement("SELECT * FROM `at_attendence` WHERE attendence_date LIKE '"+dated+"%'");
                                ResultSet rs = ps.executeQuery();
                                //out.println(rs);
                                int x=1;                                
                            while(rs.next()){
                            %>
                            <form action="EditAttendenceList.jsp">
                              <tr>
                                <td><input class="font-weight-bold" size="1" value="<%=x%>" style="border: hidden;" readonly></td>
                                <td><input class="font-weight-bold" size="50" name="tbl" value="<%=rs.getString("tbl_name")%>" style="border: hidden;" readonly></td>                                
                                <td><input class="font-weight-bold" size="20" name="atd" value="<%=rs.getString("attendence_date")%>" style="border: hidden;" readonly></td>                                
                                <td><button type="submit" class="btn btn-success getid">
                        <i class="fa fa-edit"></i> Edit </button></td>
<!--                                <td><button type="button" class="btn btn-danger delid" data-toggle="modal" data-id="<1%=rs.getString("id")%>" data-target="#exampleModalDelete">
                        <i class="fa fa-close"></i> Delete </button></td>-->
                              </tr> 
                            </form>
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
                              <!--tr>
                                <td>101</td>
                                <td>Marry</td>
                                <td>mary@hod</td>
                                <td>123</td>
                                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalEdit">
                        <i class="fa fa-edit"></i> Edit </button></td>
                                <td><a class="btn btn-danger" href=""><i class="fa fa-close"></i> Delete</a></td>
                              </tr--> 
                            </tbody>
                          </table>
                    </div>
        </div></div>
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
            var tbl = $(this).data('tbl');
            $(".modal-body #edit_tbl").val( tbl );
            var atdate = $(this).data('atdate');
            $(".modal-body #edit_atdate").val( atdate );
       });
            $(document).on("click", ".delid", function () {
            var ID = $(this).data('id');
            $(".modal-body #deleteadmin").val( ID );
       }); 
        </script>
        <script>
            $(document).ready(function(){  
                                        $('#selectdate').change(function(){  //alert($("#dept").val());   
                                            const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                                            var date = new Date($('#selectdate').val());
                                            var day = date.getDate();
                                            var month = monthNames[date.getMonth()];
                                            var year = date.getFullYear();
                                            var yr = year.toString().substr(2,2);
                                            if(day<10){
                                                day='0'+day;
                                            }
                                            var today = day+'_'+month+'_'+yr;
                                            //alert(day+"_"+month+"_"+yr);
                                            document.getElementById("seldate").value = today;
                                        });
            });
        </script>
    </body>
</html>

