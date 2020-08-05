<%-- 
    Document   : EditAttendanceWork
    Created on : Mar 19, 2020, 1:36:47 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
        <link rel="stylesheet" href="cssfiles/bootstrap.min.css">
        <link rel="stylesheet" href="cssfiles/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jsfiles/slim.min.js"></script>
        <script src="jsfiles/popper.min.js"></script>
        <script src="jsfiles/bootstrap.min.js"></script>
        <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>
        <script src="jsfiles/jquery-3.3.1.min.js"></script>
        <title>JSP Page</title>
        <style>
            body{
                background-image: url("images/ptrn1.jpg");
                background-attachment: fixed;
                background-size: 100% 100%;
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,no-revalidate");
            
            if(session.getAttribute("username")==null && session.getAttribute("teacherid")==null)
                response.sendRedirect("index.jsp");
        %>
        
        <header class="headnav font-weight-bold p-2">
            <nav class="navbar navbar-expand-lg navbar-dark fixed">
                <a class="navbar-brand" href="#">Hello ${username}</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link mr-2" href="TodayWork.jsp">Add Attendance</a>
                    <!--<a class="nav-item nav-link" href="AttendencePage.jsp">Add Attendance <span class="sr-only">(current)</span></a>-->
                    <a class="nav-item nav-link mr-2 active" href="EditAttendanceWork.jsp">Edit Attendance</a>
                    <a class="nav-item nav-link mr-2" href="ViewAttendanceWork.jsp">View Attendance</a>
                    <a class="nav-item nav-link border rounded bg-white text-dark mr-2" href="logout.jsp"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i> Logout</a>
                  </div>
<!--                    <div class="nav-item">
                          <a href="logout.jsp"><button type="button" class="btn btn-light btn-block"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i><span class="text-dark font-weight-bold">  LogOut</span></button></a>
                    </div>-->
                </div>
              </nav>
        </header>
                
        <section class="container mt-4">
            <h3 class="mb-4">EDIT STUDENT'S ATTENDANCE</h3>
            <form action="#" method="post" class="border border-dark bg-dark text-white rounded p-2"> <!--action="FindStudents.jsp"-->
                    <div class="row mt-2">                
                      <div class="form-group col col-lg-3 col-md-3 col-sm-6 col-10 mx-auto">
                          <!--<label class="font-weight-bold">Course : </label><span class="font-weight-bold" style="color: red;"> * </span>-->
                          <select class="form-control float-right" id="course" name="course" required>
                                    <option>Select Course...</option>
                                    <%
                                      Class.forName("com.mysql.jdbc.Driver");
                                      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                      PreparedStatement st = con.prepareStatement("SELECT Distinct course FROM at_timetable where t_id='"+session.getAttribute("teacherid")+"'");
                                      ResultSet rs = st.executeQuery();
                                      while(rs.next()){
                                    %>
                                    <option value="<%=rs.getString("course")%>"><%=rs.getString("course")%></option>
                                    <%
                                      }
                                    %>
                                </select>
                    </div>
                    <div class="form-group col col-lg-3 col-md-3 col-sm-6 col-10 mx-auto">
                        <!--<label class="font-weight-bold">Subject : <span class="font-weight-bold" style="color: red;"> * </span></label>-->
                        <select class="form-control float-right" id="subject" name="subject" required>
                                    <option>Select Subject...</option>
                                </select>
                    </div>
                    <div class="form-group col col-lg-3 col-md-3 col-sm-6 col-10 mx-auto">
                        <!--<label class="font-weight-bold">Attendance Date : <span class="font-weight-bold" style="color: red;"> * </span></label>-->
                        <select class="form-control float-right" id="attend" name="attend" required>
                                    <option>Select Date...</option>
                                </select>
                    </div>            
                    <div class="form-group col col-lg-3 col-md-3 col-sm-6 col-10">
                            
                        <button type="submit" class="btn text-white font-weight-bold btn-md" style="background-color: #c01432;" name="find">Find Students</button>
                    </div>    
                    </div>
                </form>            
        </section>
        <section class="container mt-4 table-responsive-sm">
            <%
                if(request.getParameter("find")!= null){
                    try 
                    {
                    String subject=request.getParameter("subject");//out.println(subject);
                    String attend_date=request.getParameter("attend");
                    Object n=session.getAttribute("teacherid");
                    String nam=n.toString();
                    String name=nam.replaceAll("-","");
                    String table="";
                    Class.forName("com.mysql.jdbc.Driver");                    
                    PreparedStatement stm = con.prepareStatement("SELECT * FROM at_attendence where tbl_name like '"+name+"%"+subject+"'");
                    ResultSet rs1 = stm.executeQuery();
                    while(rs1.next()){
                        table= rs1.getString("tbl_name");
                    }//out.println(table);
                    PreparedStatement ps = con.prepareStatement("select name,roll_no,"+attend_date+" from "+table+"");
                    ResultSet rs2 = ps.executeQuery();
                    //String x,y;
                    int x=1;
                    %>

                    <form action="Teacher/EditStuAttendence.jsp" method="post" id="student-form" onsubmit="myfunction()"><!-- onSubmit="return createList();"-->
                        <div class="container p-2 ml-auto bg-dark" style="border-radius: 10px;overflow: hidden;">
                            <label class="text-white font-weight-bold">Date: </label>
                            <input type="text" class="border border-dark rounded" name="dates" value="<%=attend_date%>" readonly>
                            <input type="hidden" name="table" value="<%=table%>" readonly>
                        </div>
                        <!--input type="text" name="dates" value="<!%=col%>" readonly=""-->
                        <div id="table_rows">    
                        <table id="student_det" class="table table-bordered table-responsive-lg p-0" style="border-radius: 10px;overflow: hidden;">
                          <thead class="text-white headnav text-center">
                            <tr>
                              <th>Sr. No.</th>
                              <th>Roll No.</th>
                              <th>Name</th>

                              <th><button style="background-color: #c01432;" type="button" class="btn text-white btn-sm checks font-weight-bold">P</button></th>
                            </tr>
                          </thead>
                          <tbody class="bg-white text-center text-dark">
                    <%
                    while(rs2.next()){
                    %>
                    <tr>                  
                    <td value=""> <%out.println(x);%></td>
                    <td id="inputroll" class="w-25"><input name="roll_<%=x%>" class="" value="<%=rs2.getString("roll_no")%>" style="border: hidden;" readonly></td>
                    <td value="<%=rs2.getString("name")%>"> <%=rs2.getString("name")%></td>

                    <!--td value="<!%out.print(date.toString());%>"> <!%out.print(date.toString());%></td-->
                    <td class="text-center" id="checkinput" value=""> <input name="boxes_<%=x%>" style="width: 1rem; height: 1rem;" class="check" id="boxes_<%out.println(x);%>" type="checkbox" <% 
                    if ("on".equals(rs2.getString(attend_date))) {
                        out.print("checked=\"checked\"");
                    } %>/></td>
                    </tr>
                    <%
                     x++;
                    }                    
                    %>
                   
            <input type="hidden" id="checkedboxvalue">
                  </tbody>
                </table> 
                </div>
                <div>
                    <button type="submit" class="btn btn-md headnav text-white font-weight-bold" onmouseover="return createList();">Edit Attendance</button>     
                </div>  
                    <input type="hidden" name="hide" id="hide">    
                </form>
                     <%
                         con.close();
                            } catch (ClassNotFoundException e) {
                                   e.printStackTrace();
                            } catch (SQLException e) {
                                   e.printStackTrace();
                          }
                        }
            %>
        </section>                        
                                
                               <script type="text/javascript">
                                    $(document).ready(function(){  
                                    $('.checks').click(function () {
                                       $('input[class=check]').prop("checked", true);
                                    });
                                    $('.checks').dblclick(function () {
                                       $('input[class=check]').prop("checked", false);
                                    });
                                    $('#boxes').click(function () {
                                       $('input[class=check]').prop("checked", false);
                                    });
                                    });
                                </script> 
                                <script>
                                    function createList(){
                                        var prodTable = document.getElementById('student_det');
                                        var x= prodTable.rows.length;
                                        document.getElementById("hide").value= x;
                                      }
                                    function myfunction(){
                                        var total=document.getElementById("hide").value-1;
                                        var check=document.getElementById("checkedboxvalue").value;
                                        alert("No. of Students: "+check+"/"+total+"\nAttendance Added Successfully");
                                      }
                                </script>
                                <script>// to calculate number of checkboxes checked
                                    $(document).ready(function(){
                                          var $checkboxes = $('#student-form td input[type="checkbox"]');

                                          $checkboxes.change(function(){
                                              var countCheckedCheckboxes = $checkboxes.filter(':checked').length;

                                              $('#checkedboxvalue').val(countCheckedCheckboxes);
                                          });
                                          $('.checks').click(function () {
                                              $('input[class=check]').prop("checked", true);
                                              var countCheckedCheckboxes = $checkboxes.filter(':checked').length;

                                              $('#checkedboxvalue').val(countCheckedCheckboxes);
                                          });
                                          $('.checks').dblclick(function () {
                                              $('input[class=check]').prop("checked", false);
                                              var countCheckedCheckboxes = $checkboxes.filter(':checked').length;

                                              $('#checkedboxvalue').val(countCheckedCheckboxes);
                                          });
                                      });
                                </script>                                
                                <script>
                                    $(document).ready(function(){ 
                                        $('#course').change(function(){  //alert($("#sem").val());                           
                                           var course=$("#course").val(); 
                                           $.post("subject.jsp",{course:course},function(data,status){
                                             $("#subject").html(data);            
                                           });
                                        });
                                        $('#subject').change(function(){
                                            var sub= $("#subject").val();
                                            var course=$("#course").val();
                                            const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                                            var today = new Date();
                                            var dd = today.getDate();
                                            if(dd<10){
                                                dd='0'+dd;
                                            }
                                            var mm = monthNames[today.getMonth()]; 
                                            var yyyy = today.getFullYear();
                                            var yy = yyyy.toString().substr(2,2);
                                            today = dd+'_'+mm+'_'+yy;
                                            //alert(teacher);
                                            var todays = new Date();
                                            var yesterday = new Date(todays);
                                            yesterday.setDate(todays.getDate() - 1);
                                            var day = yesterday.getDate();
                                            if(day<10){
                                                day='0'+day;
                                            }
                                            var mon = monthNames[yesterday.getMonth()];
                                            var year = yesterday.getFullYear();
                                            year = year.toString().substr(2,2);
                                            yesterday = day+'_'+mon+'_'+year;
                                            //alert(sub);alert(yesterday);
                                            $.post("tables.jsp",{course:course,sub: sub,today: today,yesterday:yesterday},function(data,status){
                                             // alert(data);
                                                $("#attend").html(data);
            
                                           });
                                        });
                                    });
                                </script>    
        </body>
</html>
