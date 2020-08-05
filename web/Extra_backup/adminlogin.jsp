<%-- 
    Document   : adminlogin
    Created on : Feb 20, 2020, 10:31:29 PM
    Author     : Rohit B. Kanish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin LogIn Page</title>
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
            background-image: url("images/blu.jpg");
            background-attachment: fixed;
            background-size: 100% 100%;
            } 
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row text-center text-white">
                <div class="col-lg-4 col-md-8 col-sm-10 col-12 mx-auto mt-5 login">
                    <form class="m-5">
                        <div class="mb-2">
                            <img class="imgset" src="images/avatar1.png">
                        </div>
                        <h1>Admin LogIn</h1>
                        <div class="form-group input-container d-flex mt-5">
                            <i class="fa fa-user text-center bg-dark text-white p-2 w-25 frounded"></i>
                            <input type="text" class="form-control inputrounded" placeholder="Username" id="uname" name="uname">
                        </div>
                        <div class="form-group input-container d-flex mt-2">
                            <i class="fa fa-key text-center bg-dark text-white p-2 w-25 frounded"></i>
                            <input type="password" class="form-control inputrounded" placeholder="Password" id="pass" name="pass">
                        </div>
                        <div class="form-group input-container">   
                            <button type="submit" class="btn btn-success btn-block btnrad font-weight-bold">Login</button>
                        </div>
                        <div class="form-group input-container text-right">
                            <a href="#" class="p-2 text-white"> Forget Username/Password?</a>
                        </div>
                    </form>                    
                </div>
            </div>  
        </div>
    </body>
</html>
