<%-- 
    Document   : TodayWork
    Created on : Mar 17, 2020, 1:58:56 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.rmi.CORBA.Stub"%>
<%@page import="Student.Student"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Attendance Page</title>
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
            
            if(request.getParameter("attend_name")!=null){
                //out.println(request.getParameter("attend_name"));
        %>
        <input type="text" id="disable_val" value="<%=request.getParameter("attend_name")%>">
        <%
            }
        %>
        
        <header class="headnav font-weight-bold p-2">
            <nav class="navbar navbar-expand-lg navbar-dark fixed">
                <a class="navbar-brand" href="#">Hello ${username}</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link mr-2 active" href="TodayWork.jsp">Add Attendance</a>
                    <!--<a class="nav-item nav-link" href="AttendencePage.jsp">Add Attendance <span class="sr-only">(current)</span></a>-->
                    <a class="nav-item nav-link mr-2" href="EditAttendanceWork.jsp">Edit Attendance</a>
                    <a class="nav-item nav-link mr-2" href="ViewAttendanceWork.jsp">View Attendance</a>
                    <a class="nav-item nav-link border rounded bg-white text-dark mr-2" href="logout.jsp"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i> Logout</a>
                  </div>
<!--                    <div class="nav-item">
                          <a href="logout.jsp"><button type="button" class="btn btn-light btn-block"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i><span class="text-dark font-weight-bold">  LogOut</span></button></a>
                    </div>-->
                </div>
              </nav>
        </header>
                
        <section class="container mt-4 table-responsive">
            <table class="table table-bordered" style="border-radius: 10px;overflow: hidden;">
                <thead class="headnav text-white">
                  <tr class="text-center">
                    <th colspan="7"><h2>Today's Time Table</h2></th>    
                  </tr>
                  <tr>
                    <th scope="col">Duration</th>
                    <th scope="col">Course</th>
                    <th scope="col">Semester</th>
                    <th scope="col">Section</th>
                    <th scope="col">Subject</th>
                    <th scope="col" class="text-center">Attendance</th>
                  </tr>
                </thead>
                <tbody class="bg-white">
                    <%
                                try 
                                {   String name="";
                                    Class.forName("com.mysql.jdbc.Driver"); 
                                    
                                    if(session.getAttribute("teacherid")==null){
                                        response.sendRedirect("index.jsp");
                                    }
                                    else{
                                        Object n=session.getAttribute("teacherid");
                                        name=n.toString();
                                    }
                                    DateFormat df2 = new SimpleDateFormat("E");
                                    String day = df2.format(new Date());
                                    if(day.equals("Mon")){
                                        day="Monday";
                                    }
                                    else if(day.equals("Tue")){
                                        day="Tuesday";
                                    }
                                    else if(day.equals("Wed")){
                                        day="Wednesday";
                                    }
                                    else if(day.equals("Thu")){
                                        day="Thursday";
                                    }
                                    else if(day.equals("Fri")){
                                        day="Friday";
                                    }
                                    
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                    PreparedStatement ps = con.prepareStatement("select * from at_timetable where day='"+day+"' and t_id='"+name+"'");
                                    ResultSet rs = ps.executeQuery();
                                    int x=1;
                                    String uname=name.replaceAll("-","");
                                    
                                    
                                while(rs.next()){
                    %>
                  <tr>
                <form action="AddAttendance.jsp" method="get">
                    <td><input type="time" style="border: hidden;" id="start_at_<%=x%>" value="<%=rs.getString("start_at")%>" readonly> - <input type="time" style="border: hidden;" id="end_at_<%=x%>" value="<%=rs.getString("end_at")%>" readonly></td>
                    <td><%=rs.getString("course")%></td>
                    <td><%=rs.getString("semester")%></td>
                    <td><%=rs.getString("section")%> 
                        <%if(!rs.getString("groupid").equals("null")){%>
                            (<%=rs.getString("groupid")%>)
                            <input type="hidden" name="table" value="<%=uname%>_<%=rs.getString("course")%>_<%=rs.getString("semester")%>_<%=rs.getString("section")%>_<%=rs.getString("groupid")%>_<%=rs.getString("subject_as")%>">
                        <%}else{%>
                            <input type="hidden" name="table" value="<%=uname%>_<%=rs.getString("course")%>_<%=rs.getString("semester")%>_<%=rs.getString("section")%>_<%=rs.getString("subject_as")%>">
                        <%}%></td>
                    <!--td class="text-center"><button type="button" class="btn text-white getattendance" style="background-color: #c01432;" data-toggle="modal"  data-target="#exampleModalAddAttendance">
                        <i class="fa fa-plus"></i> Take Attendance </button></td-->
                    <td><%=rs.getString("subject")%></td>
                    <td class="text-center"><button class="btn text-white" id="add_attend_<%=x%>" name="add_attend" value="add_attend_<%=x%>" style="background-color: #c01432;" type="submit" disabled><i class="fa fa-plus"></i> Take Attendance </button></td>
                </form>
                  </tr>
                    <%       
                                x++;
                               }
                    %>
                    <input type="hidden" id="total_num" value="<%=x%>">
                    <%
                               con.close();

                                 } catch (ClassNotFoundException e) {
                                        e.printStackTrace();
                                 }catch (IllegalStateException e) {
                                        e.printStackTrace();
                                 } catch (SQLException e) {
                                        e.printStackTrace();
                               }

                    %>
                </tbody>
              </table>
        </section>
                
        <!--div class="modal fade" id="exampleModalAddAttendance" tabindex="-1" role="dialog" aria-labelledby="exampleModalAddAttendanceTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header headnav text-white">
                      <h5 class="modal-title" id="exampleModalLongTitle">Add Attendance</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="text-white" aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <!%
                            try 
                              {

//                                  int dept=Integer.parseInt(request.getParameter("dept"));
//                                  int course=Integer.parseInt(request.getParameter("course"));
//                                  int sem=Integer.parseInt(request.getParameter("sem"));
//                                  int sec=Integer.parseInt(request.getParameter("section"));
//                                  String teacher=request.getParameter("teacher");
//                                  int subject=Integer.parseInt(request.getParameter("subject"));
//                                  String table="";
                                  Class.forName("com.mysql.jdbc.Driver");             
                                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
//                                  PreparedStatement stm = con.prepareStatement("SELECT c.course_name, s.semester_name, d.dept_name, sc.section_name, sb.sub_name FROM at_semester s,at_department d,at_course c,at_section sc,at_subject sb WHERE c.course_id='"+course+"' AND s.sem_id='"+sem+"' AND d.dept_id='"+dept+"' AND sc.sec_id='"+sec+"' AND sb.sub_id='"+subject+"' ");
//                                  ResultSet rs1 = stm.executeQuery();
//                                  while(rs1.next()){
//                                      table= teacher+"_"+rs1.getString("dept_name").replaceAll(" ","")+"_"+rs1.getString("course_name")+"_"+rs1.getString("semester_name")+"_"+rs1.getString("section_name")+"_"+rs1.getString("sub_name");
//                                  }//out.println(table);
                                  PreparedStatement ps = con.prepareStatement("select name,roll_no from satyawan_computerapplications_mca_iv_a_java");
                                  ResultSet rs = ps.executeQuery();//out.println(rs);
                                  //String x,y;
                                  int x=1;
                                  DateFormat df = new SimpleDateFormat("dd_MMM_yy_HH_mm_ss");
                                  String formattedDate = df.format(new Date());
                                  DateFormat df1 = new SimpleDateFormat("dd-MMM-yy HH:mm:ss");
                                  String formattedDate1 = df1.format(new Date());
                                  //out.println(formattedDate);
                                  %>
                                  <form action="StuAttendance.jsp" method="post" onsubmit="myfunction()" id="student-form"><!-- onSubmit="return createList();"-->
                                        <!--div class="container p-2 ml-auto bg-dark"><label class="text-white">Date: </label>
                                            <input type="hidden" class="border border-dark rounded" name="dates" value="<!!1%=formattedDate%>" readonly>
                                            <input type="hidden" name="table" value="<1%%>" readonly>
                                            <input type="text" class="border border-dark rounded" name="datess" value="<11%=formattedDate1%>" readonly>
                                        </div>
                                        <div id="table_rows">    
                                            <table id="student_det" class="table-bordered table-responsive-lg table-hover">
                                          <thead class="text-white text-center" style="background-color: #c01432;">
                                            <tr>
                                              <th>#</th>
                                              <th>Roll No.</th>
                                              <th>Name</th>
                                              <th><button type="button" class="btn btn-dark btn-sm checks">P</button></th>
                                            </tr>
                                          </thead>
                                          <tbody class="bg-white text-center text-dark">
                                    <1%
                                    while(rs.next()){
                                    %>
                                    <tr>                  
                                    <td value=""> <1%out.println(x);%></td>
                                    <td id="inputroll" class="w-25"><input name="roll_1<1%=x%>" class="font-weight-bold" value="<1%=rs.getString("roll_no")%>" style="border: hidden;" readonly></td>
                                    <td value="<1%=rs.getString("name")%>"> <1%=rs.getString("name")%></td>

                                    <!--td value="<!%out.print(date.toString());%>"> <!%out.print(date.toString());%></td-->
                                    <!--td class="text-center" id="checkinput" value=""> <input name="boxes_<1%=x%>" style="width: 1rem; height: 1rem;" class="check" id="boxes_<1%out.println(x);%>" type="checkbox"></td>
                                    </tr>
                                    <!%
                                     x++;
                                    }
                                    con.close();

                                      } catch (ClassNotFoundException e) {
                                             e.printStackTrace();
                                      } catch (SQLException e) {
                                             e.printStackTrace();
                                    }

                                    %>
                                          <input type="hidden" id="checkedboxvalue">
                                          </tbody>
                                        </table> 
                                        </div>
                                    <div class="modal-footer mt-3">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                        <button type="submit" id="editdeptbtn" style="background-color: #c01432;" class="btn text-white">Submit Attendance</button>                                
                                    </div>
                                  </form>
                    </div>
                  </div>
                </div>
              </div-->
                                    <script>
                                        $(document).ready(function(){
                                            var max=document.getElementById('total_num').value;
                                            var i;
                                            for(i=1;i<max;i++){
                                                var end=document.getElementById('start_at_'+i).value;
                                                var end_time=end.split(":");
                                                var d= new Date();
                                                var hr=d.getHours();
                                                var min=d.getMinutes();
                                                var sec=d.getSeconds();
                                                var current_time=hr+":"+min+":"+sec;
                                                //alert(max);
                                                if(end_time[0]>=hr){
                                                    if(end_time[1]<=min){                                                        
                                                            //alert("yes"); 
                                                            document.getElementById('add_attend_'+i).disabled= false;
                                                    }
                                                    else{
                                                            //alert("no1");
                                                            
                                                    }
                                                }
                                                else{
                                                    //alert("no");
                                                    document.getElementById('add_attend_'+i).disabled= false;
                                                }
                                            }                                            
                                        });
                                    </script>
    </body>
</html>
