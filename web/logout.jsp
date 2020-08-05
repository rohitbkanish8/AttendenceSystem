<%-- 
    Document   : logout
    Created on : Mar 10, 2020, 1:58:07 PM
    Author     : Rohit B. Kanish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session= request.getSession();
            response.setHeader("Cache-Control","no-cache"); 
            response.setHeader("Cache-Control","no-store"); 
            response.setDateHeader("Expires", 0);
            response.sendRedirect("index.jsp");
            session.invalidate();
        %>
    </body>
</html>
