<%-- 
    Document   : SelectedAttendenceList
    Created on : Mar 9, 2020, 8:41:49 PM
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
        <title>Selected Attendance List</title>
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
        <!--jsp:include page="/header.jsp" /-->
                <header class="text-white text-center p-4 border-bottom" style="background-color: #111;">
            <div>
                <h1>ATTENDANCE SYSTEM</h1>
            </div>
        </header>
            <div class="row container-fluid">
                
                <div class="col-lg-12 text-white">
                    
                    <div id="main">
                      <h2 class="mt-4 ml-5">SELECTED ATTENDANCE LIST</h2> 
                   
                    <div>
                    <div class="row mt-4">
                        <div class="col-lg-7 text-right col-sm-5 ml-auto">
                            <form class="form-inline" action="AttendenceList.jsp">
                            <input type="submit" class="btn btn-primary" value="Back">
                            </form>
                        </div>
                        <div class="col-lg-4 col-sm-5">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
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
                            {   
                                String tbl_name=request.getParameter("table_name");
                                String dates=request.getParameter("seldate");
                                //out.println(tbl_name);out.println(dates);
                                Class.forName("com.mysql.jdbc.Driver"); 
                                Connection con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
                                PreparedStatement ps = con.prepareStatement("SELECT * FROM `at_attendence` WHERE tbl_name='"+tbl_name+"' AND attendence_date LIKE '"+dates+"%'");
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
                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLongTitle">Create New Section </h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <form action="Admin/InsertStudent.jsp">
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
                            <label class="font-weight-bold">Select Semester: </label>
                            </div>
                            <div class="col-lg-6">
                            <select class="form-control" id="sem" name="sem">
                                    <option>Select Semester...</option>
                            </select>
                            </div>
                            </div>
                            <div class="row ml-auto text-center mt-2">
                            <div class="col-lg-6">
                            <label class="font-weight-bold">Upload File:</label>
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
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Table: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_tbl" name="edit_tbl" type="text" placeholder="Admin"/>
                            </div>
                            <div class="col-lg-6">
                            <label class="text-dark font-weight-bold">Date: </label>
                            </div>
                            <div class="col-lg-6">
                                <input class="form-control float-left" id="edit_atdate" name="edit_atdate" type="text" placeholder="Admin"/>
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
            });
        </script>
    </body>
</html>

