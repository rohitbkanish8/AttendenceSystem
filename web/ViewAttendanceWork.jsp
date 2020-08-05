<%-- 
    Document   : ViewAttendanceWork
    Created on : Mar 19, 2020, 5:25:15 PM
    Author     : Rohit B. Kanish
--%>

<%@page import="java.text.DecimalFormat"%>
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
                    <a class="nav-item nav-link mr-2" href="EditAttendanceWork.jsp">Edit Attendance</a>
                    <a class="nav-item nav-link mr-2 active" href="ViewAttendanceWork.jsp">View Attendance</a>
                    <a class="nav-item nav-link border rounded bg-white text-dark mr-2" href="logout.jsp"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i> Logout</a>
                  </div>
<!--                    <div class="nav-item">
                          <a href="logout.jsp"><button type="button" class="btn btn-light btn-block"><i class="text-dark fa fa-external-link-square" aria-hidden="true"></i><span class="text-dark font-weight-bold">  LogOut</span></button></a>
                    </div>-->
                </div>
              </nav>
        </header>
                
        <section class="container mt-4">
            <h3 class="mb-4">VIEW STUDENT'S ATTENDANCE</h3>
            <form action="#" method="get" class="border border-dark bg-dark text-white rounded p-2"> <!--action="FindStudents.jsp"-->
                    <div class="row mt-2">                
                      <div class="form-group col col-lg-4 col-md-3 col-sm-6 col-10 mx-auto">
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
                    <div class="form-group col col-lg-4 col-md-3 col-sm-6 col-10 mx-auto">
                        <!--<label class="font-weight-bold">Subject : <span class="font-weight-bold" style="color: red;"> * </span></label>-->
                        <select class="form-control float-right" id="subject" name="subject" required>
                                    <option>Select Subject...</option>
                                </select>
                    </div>        
                    <div class="form-group col col-lg-4 col-md-3 col-sm-6 col-10">
                            
                        <button type="submit" class="btn text-white font-weight-bold btn-md" style="background-color: #c01432;" name="find">Find Students</button>
                    </div>    
                    </div>
                </form>   
        </section>
        <section class="container mt-4 table-responsive">
            <%
                if(request.getParameter("find")!= null){
                 try 
                {
                    String course=request.getParameter("course");
                    String subject=request.getParameter("subject");
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
                    PreparedStatement ps = con.prepareStatement("select * from "+table);
                    ResultSet rs2 = ps.executeQuery();//out.println(rs);
                    //String x,y;
                    int x=1;
                    DateFormat df = new SimpleDateFormat("dd_MMM_yy_HH_mm_ss");
                    String formattedDate = df.format(new Date());
                    DateFormat df1 = new SimpleDateFormat("dd-MMM-yy HH:mm:ss");
                    String formattedDate1 = df1.format(new Date());
                    
                 %>
                 <form action="#" method="get"><!-- onSubmit="return createList();"-->
                            <div class="container p-2 ml-auto bg-dark" style="border-radius: 10px;overflow: hidden;">
                                <label class="text-white font-weight-bold">Date: </label>
                                <input type="hidden" class="border border-dark rounded" name="dates" value="<%=formattedDate%>" readonly>
                                <input type="hidden" name="table" value="<%=table%>" readonly>
                                <input type="text" class="border border-dark rounded" name="datess" value="<%=formattedDate1%>" readonly>
                            </div>
                            <div id="table_rows">    
                                <table id="student_det" class="table table-bordered table-responsive-lg p-0" style="border-radius: 10px;overflow: hidden;">
                              <thead class="text-white headnav text-center">
                                  <%
                                        PreparedStatement ps1 = con.prepareStatement("SELECT column_name FROM information_schema.columns WHERE table_schema = 'attendence' AND  table_name = '"+table+"' ");//"+today+"  "+yesterday+"
                                        // ps.setString(1,department);
                                         //out.print(ps);
                                         ResultSet rst = ps1.executeQuery();
                                         float last=0;
                                  %>
                                <tr>
                                    <%
                                        while (rst.next()) { 
                                    %>
                                    <th><%=rst.getString("column_name").toUpperCase()%></th>
                                  <%
                                      last++;
                                      }
                                  %>
                                  <th>TOTAL</th>
                                  <th>AVERAGE</th>
                                </tr>
                              <!--<input type="text" value="<1%=last-3%>">-->
                              </thead>
                              <tbody class="bg-white text-center text-dark">
                        <%
                            float total=last-3;
                            DecimalFormat forms = new DecimalFormat("0.00");
                                                        
                        while(rs2.next()){
                            float sum=0;
                            float avg=0;
                        %>
                        <tr>                  
                        <td value=""><%=rs2.getString("id")%></td>
                        <td id="inputroll" class="w-25"><input name="roll_<%=x%>" class="" size="5" value="<%=rs2.getString("roll_no")%>" style="border: hidden;" readonly></td>
                        <td value="<%=rs2.getString("name")%>"> <%=rs2.getString("name")%></td>
                        <%for (int i = 4; i <= last; i++) { 
                            String present ="";
                           if(rs2.getString(i).equals("null")){
                               present ="A";
                        %>
                                <td class="text-danger font-weight-bold" value="<%=present%>"> <%=present%></td> 
                        <%
                           } 
                           else{
                               sum++;
                               present ="P";
                        %>            
                                <td class="text-success font-weight-bold" value="<%=present%>"> <%=present%></td> 
                        <%        
                            }
                            avg=(sum/total)*100;
                          }  
                          
                        %>
                        <td><%=(int)sum%>/<%=(int)total%></td>
                        <td><%=forms.format(avg)%>%</td>
                        </tr>
                        <%
                         x++;
                        }
                        %>
                   
            <input type="hidden" id="checkedboxvalue">
                  </tbody>
                </table> 
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
                                <script>
                                    $(document).ready(function(){ 
                                        $('#course').change(function(){  //alert($("#sem").val());                           
                                           var course=$("#course").val(); 
                                           $.post("subject.jsp",{course:course},function(data,status){
                                             $("#subject").html(data);            
                                           });
                                        });
                                            });
                                </script> 
        </body>
</html>