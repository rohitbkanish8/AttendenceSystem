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
        <!--        <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>-->
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


        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,no-revalidate");

            if (session.getAttribute("username") == null)
                response.sendRedirect("index.jsp");
        %>
        <!--jsp:include page="/header.jsp" /-->

        <div class="row m-0">
            <div class="col-md-6 p-3">
                <a onclick="openNav()" ondblclick="closeNav()" href="#">&#9776; Menu</a>
            </div>

            <div class="col-md-6 text-primary p-3 text-right">
                <h2>Time Table</h2>
                <h6>ATTENDANCE SYSTEM</h6>
            </div>
        </div>

        <div class="text-center">
    
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Upload CSV 
            </button>
        </div>

        <div class="row m-0">

            <div class="col-lg-12 text-white">
                <%@include file="include/sideNavBar.jsp"%>

                <div id="main">

                    <div class="table-responsive">
                        <%
                            Connection con = null;
                            ResultSet resultSet = Utility.DatabaseUtils.executeQuery("SELECT * FROM ut_timetable", con);

                            if (false != resultSet.next()) {

                        %>

                        <table class="table text-dark text-center small table-sm" id="myTable">
                            <thead>
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Teacher id</th>
                                    <th>Day</th>
                                    <th>Course</th>
                                    <th>Time</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  
                                   int count = 0; 
                                    while (resultSet.next()) {
                                %>
                                <tr>
                                    <td><%=++count%>.</td>
                                    <td><%=resultSet.getString("t_id")%></td>
                                    <td><%=resultSet.getString("day")%></td>
                                    <td><%=resultSet.getString("course")%></td>
                                    <td><%=resultSet.getString("start_at")%></td>

                                    <td>
                                        <button type="button" class="btn btn-success getid btn-sm" data-toggle="modal">
                                            <i class="fa fa-edit"></i> Edit 
                                        </button>

                                        <button type="button" class="btn btn-danger delid btn-sm" data-toggle="modal">
                                            <i class="fa fa-close"></i> Delete 
                                        </button>
                                    </td>
                                </tr> 

                                <%
                                    }
                                    if (null != con)
                                        con.close();
                                %>

                            </tbody>
                        </table>
                        <script>
                            $(document).ready(function () {
                                var table = $('#myTable').DataTable();
                                $('#myInputTextField').keyup(function () {
                                    table.search($(this).val()).draw();
                                })
                            });
                        </script>
                        <%
                        } else {

                        %>

                        <h4 class="p-4 rounded bg-white text-primary text-center">No Record Found</h4>
                        <%                                    }
                        %>
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
    </body>
</html>


