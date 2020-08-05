<%-- 
    Document   : login
    Created on : Feb 20, 2020, 8:18:20 PM
    Author     : Rohit B. Kanish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogIn Page</title>
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
            background-image: url("images/red.jpg");
            /*background: linear-gradient(to top, #c31432, #240b36);*/
            background-attachment: fixed;
            background-size: 100% 100%;
            } 
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row text-center text-white">
                <div class="col-lg-4 col-md-8 col-sm-10 col-12 mx-auto mt-5 login">
                    <form class="m-5" action="login.jsp" method="post">
                        <div class="mb-2">
                            <img class="imgset" src="images/avatar.png">
                        </div>
                        <h1> LogIn </h1>
                        <div class="form-group input-container d-flex mt-5">
                            <select class="p-2 w-100 text-white d-block btnrad" style="background: black;border: black" id="user" name="user">
                                <option value="1">Admin</option>
                                <option value="2">Teacher</option>
                            </select>
                        </div>
                        <div class="form-group input-container d-flex mt-2">
                            <i class="fa fa-user text-center text-white p-2 w-25 frounded" style="background: black;"></i>
                            <input type="text" class="form-control inputrounded" placeholder="Username" id="uname" name="uname">
                        </div>
                        <div class="form-group input-container d-flex mt-2">
                            <i class="fa fa-key text-center text-white p-2 w-25 frounded" style="background: black;"></i>
                            <input type="password" class="form-control inputrounded" placeholder="Password" id="pass" name="pass">
                        </div>
                        <div class="form-group input-container">   
                            <input type="submit" value="Login" class="btn btn-block text-white btnrad font-weight-bold" style="background: #04b92d;">
                        </div>
                        <div class="form-group input-container">
                            <a href="#" class="p-2 text-white"> Forget Username/Password?</a>
                        </div>
                    </form>                    
                </div>
            </div>  
        </div>
    </body>
</html>