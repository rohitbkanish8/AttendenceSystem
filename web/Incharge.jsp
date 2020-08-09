<%-- 
    Document   : Incharge
    Created on : Aug 7, 2020, 3:19:37 PM
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
        <title>Piet</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="cssfiles/bootstrap.min.css"   crossorigin="anonymous">
                <!-- Optional JavaScript -->
                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <script src="jsfiles/slim.min.js"       crossorigin="anonymous"></script>    
                <script src="jsfiles/popper.min.js"     crossorigin="anonymous"></script>
                <script src="jsfiles/bootstrap.min.js"  crossorigin="anonymous"></script>
                <script src="jsfiles/selectyourclass.js" type="text/javascript" ></script>
                <script src="jsfiles/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <hr>
        <div style="background-color: #f8d7da; height: 60px;"><div class="container">
                <div class="row">
                    <div class="col-sm-2"><p class="text" style="font-size: 34px;"><b>PIET</b></p></div>
                    <div class="col-md-6"><p class="text-center" style="font-size: 34px;"><b>Project Academic Portal</b></p></div>
                    <div class="col-sm-4"><p class="text" style="font-size: 34px; margin-left: 30%;"><b>MCA 6th Sem</b></p></div>
                </div>
            </div></div>
        <hr>
        <nav class="navbar navbar-expand-lg navbar-light bg-light h6" >
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="Incharge.html" id="1">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="profile">Profile</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Records</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink1">
                                    <a class="dropdown-item" href="#" id="student">Student Records</a>           
                                    <a class="dropdown-item" href="#" id="mentors">Mentors</a>
                                </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Requests</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#Training">Training Letter</a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#Something">Something else</a>
                                </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Meetings</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink3">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#Synopsismeeting">Add Synopsis Meeting Details</a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#Projectreview">Add Project Review Meeting Details</a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#Extrameeting">Add Extra Meeting Details</a>
                                </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Viva Details</a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink4">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#Internal">Add Internal Viva Details</a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#External">Add External Viva Details</a>
                                </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="final">Final Reports</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" style="margin-left: 100px;">
                        <input class="form-control mr-sm-1" id="search" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" id="butn" type="submit" onclick="link()">Search</button>
                            <script type="text/javascript">
                                function link() {
                                    var links = document.getElementById('search').value;
                                    document.getElementById('butn').innerHTML = links.link()
                                }
                            </script>
                            <button class="btn btn-success" type="button" onclick="window.location.href='Login.jsp'" style="margin-left: 4px;">Log Out</button>
                    </form>      
                </div></div>
        </nav><br>
        <div class="container" id="load">
            <div class="card">
  <div class="card-header text-center">Teachers</div>
  <div class="card-body">
      <div class="">
                                                      <table class="table table-bordered table-hover">
                                                    <thead>
                                                      <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Department</th>
                                                        <th scope="col">Username</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                        <th scope="col">Action</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                try 
                                {   Class.forName("com.mysql.jdbc.Driver"); 
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendence?zeroDateTimeBehavior=convertToNull", "root", "");
                                    PreparedStatement ps = con.prepareStatement("SELECT t.*,d.dept_name FROM at_teacher t JOIN at_department d on t.t_dept = d.dept_id");
                                    ResultSet rs = ps.executeQuery();


                                while(rs.next()){
                                %>
                                                      <tr>
                                                        <tr>
                                                        <td><%=rs.getString("id")%></td>
                                                        <td><%=rs.getString("t_name")%></td>
                                                        <td><%=rs.getString("dept_name")%></td>
                                                        <td><%=rs.getString("t_username")%></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
                                                        <td><button type="button" class="btn btn-success getid">Edit<i class="fa fa-edit"></i></button></td>
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
                                                  </table></div>
  </div>
            </div><br>
            <div class="container" id="load">
            <div class="card w-75" style="margin-left: 10%;">
  <div class="card-header text-center">Viva Details</div>
  <div class="card-body">
      <div class="container">
                                                      <table class="table table-bordered table-hover">
                                                    <thead>
                                                      <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Date</th>
                                                        <th scope="col">Time</th>
                                                        <th scope="col">Message</th>
                                                        <th scope="col">Update</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                      <tr>
                                                        <tr>
                                                        <th scope="row">Internal Viva</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#Internal">Update</a></td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">External Viva</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#External">Update</a></td>
                                                      </tr>
                                                    </tbody>
                                                  </table></div>
  </div>
            </div><br>
            <div class="card w-75" style="margin-left: 10%;">
  <div class="card-header text-center">All Requests</div>
  <div class="card-body">
      <div class="container">
                                                      <table class="table table-bordered table-hover">
                                                    <thead>
                                                      <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Univ. Roll No.</th>
                                                        <th scope="col">Class Roll No.</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Message</th>
                                                        <th scope="col">View</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                      <tr>
                                                        <th scope="row">1</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#view6">Click to View.</a></td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">2</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#view7">Click to View.</a></td>
                                                      </tr>
                                                    </tbody>
                                                  </table></div>
  </div>
            </div></div></div>
        <!--Modals of Requests-->
        <div class="modal fade" id="Training" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Requests Of Training Letter</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                  <div class="container">
                                                      <br><table class="table table-bordered table-hover">
                                                    <thead>
                                                      <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Univ. Roll No.</th>
                                                        <th scope="col">Class Roll No.</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Message</th>
                                                        <th scope="col">View</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                      <tr>
                                                        <th scope="row">1</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#view6">Click to View.</a></td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">2</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#view6">Click to View.</a></td>
                                                      </tr>
                                                    </tbody>
                                                  </table></div>
                                                <div class="modal-footer">
                                                  <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
        <div class="modal fade" id="Something" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Requests Of Something else</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                  <div class="container">
                                                      <br><table class="table table-bordered table-hover">
                                                    <thead>
                                                      <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Univ. Roll No.</th>
                                                        <th scope="col">Class Roll No.</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Message</th>
                                                        <th scope="col">View</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                      <tr>
                                                        <th scope="row">1</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#view6">Click to View.</a></td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">2</th>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><a href="#" data-toggle="modal" data-target="#view6">Click to View.</a></td>
                                                      </tr>
                                                    </tbody>
                                                  </table></div>
                                                <div class="modal-footer">
                                                  <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
        <!-- Ending of Modals of Requests-->
        <!--Modals of Meetings-->
        <div class="modal fade" id="Synopsismeeting" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-sm" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Add Synopsis Meeting Details</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                  <br><div class="container">
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Date:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select date" type="text" id="date-picker-example" class="form-control datepicker">
</div>
                                                              <script type="text/javascript">
            $(function () {
                $('.datepicker').pickadate({
                    // Strings and translations
monthsFull: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October',
'November', 'December'],
monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
weekdaysFull: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
weekdaysShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
showMonthsShort: undefined,
showWeekdaysFull: undefined,

// Buttons
today: 'Today',
clear: 'Clear',
close: 'Close',

// Accessibility labels
labelMonthNext: 'Next month',
labelMonthPrev: 'Previous month',
labelMonthSelect: 'Select a month',
labelYearSelect: 'Select a year',

// Formats
format: 'd mmmm, yyyy',
formatSubmit: undefined,
hiddenPrefix: undefined,
hiddenSuffix: '_submit',
hiddenName: undefined,

// Editable input
editable: undefined,

// Dropdown selectors
selectYears: undefined,
selectMonths: undefined,

// First day of the week
firstDay: undefined,

// Date limits
min: undefined,
max: undefined,

// Disable dates
disable: undefined,

// Root picker container
container: undefined,

// Hidden input container
containerHidden: undefined,

// Close on a user action
closeOnSelect: true,
closeOnClear: true,

// Events
onStart: undefined,
onRender: undefined,
onOpen: undefined,
onClose: undefined,
onSet: undefined,
onStop: undefined,

// Classes
klass: {

// The element states
input: 'picker__input',
active: 'picker__input--active',

// The root picker and states *
picker: 'picker',
opened: 'picker--opened',
focused: 'picker--focused',

// The picker holder
holder: 'picker__holder',

// The picker frame, wrapper, and box
frame: 'picker__frame',
wrap: 'picker__wrap',
box: 'picker__box',

// The picker header
header: 'picker__header',

// Month navigation
navPrev: 'picker__nav--prev',
navNext: 'picker__nav--next',
navDisabled: 'picker__nav--disabled',

// Month & year labels
month: 'picker__month',
year: 'picker__year',

// Month & year dropdowns
selectMonth: 'picker__select--month',
selectYear: 'picker__select--year',

// Table of dates
table: 'picker__table',

// Weekday labels
weekdays: 'picker__weekday',

// Day states
day: 'picker__day',
disabled: 'picker__day--disabled',
selected: 'picker__day--selected',
highlighted: 'picker__day--highlighted',
now: 'picker__day--today',
infocus: 'picker__day--infocus',
outfocus: 'picker__day--outfocus',

// The picker footer
footer: 'picker__footer',

// Today, clear, & close buttons
buttonClear: 'picker__button--clear',
buttonClose: 'picker__button--close',
buttonToday: 'picker__button--today'
                }
            });
        });
        </script>
                                                          </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Time:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select time" type="text" id="input_starttime" class="form-control timepicker">
</div>
                                                              <script type="text/javascript">
                                                                  $(function () {
                                                                  $('#input_starttime').pickatime({                                                                      
                                                                  })
                                                              });
                                                              </script>
                                                          </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                          Message:    
                                                          </div>
                                                          <div class="col-auto">
                                                              <textarea class="text" maxlength="1000" title="Max Character Length: 1000" rows="5"></textarea>
                                                          </div>
                                                      </div>
                                                  </div><br>
                                                <div class="modal-footer">
                                                  <button type="button" class="btn btn-info">Update</button>
                                                  <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
        <div class="modal fade" id="Projectreview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-sm" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Add Project Review Meeting Details</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                  <br><div class="container">
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Date:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select date" type="text" id="date-picker-example" class="form-control datepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Time:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select time" type="text" id="input_starttime" class="form-control timepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                          Message:    
                                                          </div>
                                                          <div class="col-auto">
                                                              <textarea class="text" maxlength="1000" title="Max Character Length: 1000" rows="5"></textarea>
                                                          </div>
                                                      </div>
                                                  </div><br>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-info">Update</button>
                                                  <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
        <div class="modal fade" id="Extrameeting" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-sm" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Add Extra Meeting Details</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                  <div class="container">
                                                      <br><div class="container">
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Date:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select date" type="text" id="date-picker-example" class="form-control datepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Time:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select time" type="text" id="input_starttime" class="form-control timepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                          Message:    
                                                          </div>
                                                          <div class="col-auto">
                                                              <textarea class="text" maxlength="1000" title="Max Character Length: 1000" rows="5"></textarea>
                                                          </div>
                                                      </div>
                                                  </div><br>
                                                  </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-info">Update</button>
                                                  <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
        <!-- Ending of Modals of Meetings-->
        <!--Modals of Vivas-->
        <div class="modal fade" id="Internal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-sm" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Add Internal Viva Details</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                  <div class="container">
                                                      <br><div class="container">
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Date:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select date" type="text" id="date-picker-example" class="form-control datepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Time:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select time" type="text" id="input_starttime" class="form-control timepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                          Message:    
                                                          </div>
                                                          <div class="col-auto">
                                                              <textarea class="text" maxlength="1000" title="Max Character Length: 1000" rows="5"></textarea>
                                                          </div>
                                                      </div>
                                                  </div><br>
                                                  </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-info">Update</button>
                                                  <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
        <div class="modal fade" id="External" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-sm" role="document">
                                              <div class="modal-content">
                                                <div class="modal-header">
                                                  <h5 class="modal-title" id="exampleModalLabel">Add External Viva Details</h5>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                  <div class="container">
                                                      <br><div class="container">
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Date:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select date" type="text" id="date-picker-example" class="form-control datepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                              Time:
                                                          </div>
                                                          <div class="col-auto">
                                                              <div class="md-form">
  <input placeholder="Select time" type="text" id="input_starttime" class="form-control timepicker">
</div>
                                                              </div>
                                                      </div><br>
                                                      <div class="row">
                                                          <div class="col text-center">
                                                          Message:    
                                                          </div>
                                                          <div class="col-auto">
                                                              <textarea class="text" maxlength="1000" title="Max Character Length: 1000" rows="5"></textarea>
                                                          </div>
                                                      </div>
                                                  </div><br>
                                                  </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-info">Update</button>
                                                  <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
        <!-- Ending of Modals of Vivas-->
        <!--Modals of View-->
        <div class="modal fade" id="view6" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle" style="margin-left: 35%;"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        <div class="modal fade" id="view7" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle" style="margin-left: 35%;"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        <div class="modal fade" id="view8" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle" style="margin-left: 35%;"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        <div class="modal fade" id="view9" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle" style="margin-left: 35%;"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        <!-- Ending of Modals of View-->
            <script type="text/javascript">
                $(document).ready(function(){
                    $('#student').click(function(){
                        $('#load').load('Studentrecords.jsp',function(){                            
                        });
                    })
                });
            </script>
            <script type="text/javascript">
                $(document).ready(function(){
                    $('#mentors').click(function(){
                        $('#load').load('mentorsrecords.jsp',function(){                            
                        });
                    })
                });
            </script>
            <script type="text/javascript">
                $(document).ready(function(){
                    $('#profile').click(function(){
                        $('#load').load('InchargeProfile.jsp',function(){                            
                        });
                    })
                });
            </script>
            <script type="text/javascript">
                $(document).ready(function(){
                    $('#final').click(function(){
                        $('#load').load('FinalReports.jsp',function(){                            
                        });
                    })
                });
            </script>
            
    </body>
</html>

