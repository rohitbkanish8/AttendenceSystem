
<%-- 
    Document   : index.jsp
    Created on : Feb 7, 2020, 8:18:39 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Page</title>
        <link rel="stylesheet" href="cssfiles/bootstrap.min.css">
        <link rel="stylesheet" href="cssfiles/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jsfiles/slim.min.js"></script>
        <script src="jsfiles/popper.min.js"></script>
        <script src="jsfiles/bootstrap.min.js"></script>
        <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>
        <script src="jsfiles/jquery-3.3.1.min.js"></script>
        <style>
            body{
                background-image: url("images/p2.jpg");
                background-attachment: fixed;
                background-size: 100% 100%;
            } 
            
        </style>
    </head>
    <body class="">
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,no-revalidate");
            
            if(session.getAttribute("username")==null)
                response.sendRedirect("index.jsp");
        %>
        <div class="container-fluid font-weight-bold fixed bg-dark text-white">
                <h1 class="text-center p-2">ATTENDANCE MANAGEMENT</h1>
                <nav class="navbar navbar-expand-lg navbar-dark">
                    <a class="navbar-brand" href="#">Hello ${username}</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                      <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="AttendencePage.jsp">Add Attendance <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="EditAttendencePage.jsp">Edit Attendance</a>
                        <a class="nav-item nav-link" href="ViewAttendencePage.jsp">View Attendance</a>
                      </div>
                        <div class="nav-item ml-auto p-2">
                            <a href="logout.jsp"><button type="button" class="btn btn-light btn-block"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i><span class="text-dark font-weight-bold">  LogOut</span></button></a>
                        </div>
                    </div>
                  </nav>
        </div>
        <div class="container font-weight-bold mt-4 p-4 text-white border-white rounded" style="border-style: double;border-width: thick;">
            <div class="container-fluid font-weight-bold p-4 border border-light rounded">
                <form action="Students.jsp" name="at_page"> <!--action="FindStudents.jsp"-->
                    <div class="row">                
                      <div class="form-group col col-lg-6 col-md-3 col-sm-6 col-10 mx-auto">
                          <select class="form-control" id="dept" name="dept" required>
                                    <option>Select Department...</option>
                                    <%
                                      Class.forName("com.mysql.jdbc.Driver");
                                      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                      PreparedStatement st = con.prepareStatement("SELECT * FROM at_department");
                                      ResultSet rs = st.executeQuery();
                                      while(rs.next()){
                                    %>
                                    <option value="<%=rs.getString("dept_id")%>"><%=rs.getString("dept_name")%></option>
                                    <%
                                      }
                                    %>
                                </select>
                    </div>
                    <div class="form-group col col-lg-6 col-md-3 col-sm-6 col-10 mx-auto">
                        <select class="form-control" id="course" name="course" required>
                                    <option>Select Course...</option>
                                </select>
                    </div>
                    <div class="form-group col col-lg-6 col-md-3 col-sm-6 col-10 mx-auto">
                        <select class="form-control" id="sem" name="sem" required>
                                    <option>Select Semester...</option>
                                </select>
                    </div>
                    <div class="form-group col col-lg-6 col-md-3 col-sm-6 col-10 mx-auto">
                        <select class="form-control" id="section" name="section" required>
                                    <option>Select Section...</option>
                        </select>
                        <label class="font-weight-normal"><em>If there is no section, then select 'A'</em></label>
                    </div>
                    <div class="form-group col col-lg-6 col-md-3 col-sm-6 col-10 mx-auto">
                                    <input type="text" name="teacher" value="${username}" required>
                    </div>
                    <div class="form-group col col-lg-6 col-md-3 col-sm-6 col-10 mx-auto">
                        <select class="form-control" id="subject" name="subject" required>
                                    <option>Select Subject...</option>
                                    <%
                                      Class.forName("com.mysql.jdbc.Driver");
                                      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                      PreparedStatement stm = conn.prepareStatement("SELECT * from at_subject where t_id=(select id from at_teacher where t_name='"+session.getAttribute("username")+"')");
                                      ResultSet rs1 = stm.executeQuery();
                                      
                                      while(rs1.next()){
                                    %>
                                    <option value="<%=rs1.getString("sub_id")%>"><%=rs1.getString("sub_name")%></option>
                                    <%
                                      }
                                    %>
                                </select>
                    </div>
                    <%out.println("SELECT * from at_subject where t_id=(select id from at_teacher where t_name='"+session.getAttribute("username")+"')");%>
                    <div class="form-group col col-lg-6 col-md-3 col-sm-6 col-10 mx-auto">
                            <button type="submit" class="btn btn-primary btn-md find_stud">Find Students</button>
                    </div>    
                    </div>
                </form>
            </div>
            <!--div class="p-4">
                <form>
                <div id="table_rows">    
                <table class="table table-bordered table-responsive-md bg-white table-hover p-0">
                  <thead class="text-white bg-success text-center">
                    <tr>
                      <th>Sr. No.</th>
                      <th>Name</th>
                      <th>Roll No.</th>
                      <th>Date</th>
                      <th><button type="button" class="btn btn-primary btn-sm checks">P</button></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td colspan="5">No rows selected.</td>                      
                    </tr>
    
                  </tbody>
                </table> 
                </div>
                <div>
                   <button type="submit" class="btn btn-primary btn-md">Submit Attendance</button>     
                </div>  
                        
                </form>
            </div-->
        </div>
                                <script type="text/javascript">
                                    $(document).ready(function(){  
                                        $('#dept').change(function(){  //alert($("#dept").val());                           
                                           var dept=$("#dept").val(); 
                                           $.post("Course.jsp",{department:dept},function(data,status){
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
                                        $('.checks').click(function () {
                                          $('input[name=present]').prop("checked", true);
                                        });
                                        $('#boxes').click(function () {
                                          $('input[name=present]').prop("checked", false);
                                        });
                                    });
                                    
                                    $(function (){
                                       $("form[name='at_page']").validate({
                                           rules:{
                                           dept: "required",
                                           course: "required",
                                           sem: "required",
                                           section: "required",
                                           subject: "required"
                                       },
                                       messages:{
                                           dept: "Please Select Department",
                                           course: "Please Select Course",
                                           sem: "Please Select Semester",
                                           section: "Please Select Section",
                                           subject: "Please Select Subject"
                                       }
                                       }); 
                                    });
                                </script>    
    </body>
</html>
