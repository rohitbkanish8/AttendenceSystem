<%-- 
    Document   : upload_page
    Created on : Mar 24, 2020, 2:16:25 PM
    Author     : Rohit B. Kanish
--%>

<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String contentType = request.getContentType();
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {//out.println("hjs");
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;

            while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            String saveFile = file.substring(file.indexOf("filename=\"") + 10);
            out.println("saveFile=" + saveFile);
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
            out.println("saveFile:" + saveFile);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1,contentType.length());
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

            FileOutputStream fileOut = new FileOutputStream(saveFile);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            %>
            <b>File <% out.println(saveFile); %> has been uploaded and inserted into Database.</b>
            <%Connection con=null;
            Statement pst=null,stm=null;
            String line = null;
            String value=null;
            try{out.println(saveFile);
            StringBuilder contents = new StringBuilder();
            BufferedReader input = new BufferedReader(new FileReader(saveFile));
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection(Constants.Constants.DB_HOST_URL, Constants.Constants.DB_USER_NAME, Constants.Constants.DB_PASSWORD);
            while (( line = input.readLine()) != null){
            contents.append(line);
            contents.append("#");
            }
            value = contents.toString();
            out.println("Value:"+value);out.println(value.length());
            pst=con.createStatement();
            System.out.println("Ye chl ra hai");
            pst.executeUpdate("insert into upload_timetable(table_name,value) values('"+saveFile+"','"+value+"')");
            
            System.out.println("Ye bhi chl ra hai");
            out.println("ndjshd");
            //out.println(val);
//            if(val>0)
//            {
            try{
                response.sendRedirect("add_db.jsp?table_name="+saveFile);
                }
            catch(Exception e){
                //String h=String.valueOf();
                e.printStackTrace();
                }
//            }
            con.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            }
        %>
    </body>
</html>
