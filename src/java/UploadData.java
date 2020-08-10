/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig

/**
 *
 * @author Rohit B. Kanish
 */
public class UploadData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet fetchData</title>");            
            out.println("</head>");
            out.println("<body>");
            
            //Getting File Name
            Part part = request.getPart("file");
            String FileName=part.getSubmittedFileName();
            System.out.println("File Name : "+FileName);
            
            //Getting File Path
            
            //String Path=request.getRealPath("/")+"file"+File.separator+part.getSubmittedFileName();
            
            String path = Constants.Constants.FILE_REPO + "/" + part.getName();
                    
            
            System.out.println("File Path : "+path);
            
            //Saving File To the Project 
           
            InputStream io=part.getInputStream();
            byte b[] =new byte[io.available()];
            io.read(b);
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            
            //Fetching Data from the File
            
           //String fileName=part.getSubmittedFileName();
            File file=new File(path);
            Scanner inputData=new Scanner(file);
            //String st=null;
            
            Class.forName("com.mysql.jdbc.Driver"); 
            Connection con = DriverManager.getConnection(
                    Constants.Constants.DB_HOST_URL, 
                    Constants.Constants.DB_USER_NAME, 
                    Constants.Constants.DB_PASSWORD);
            
            
            Statement statement = con.createStatement();
            Long startTime = System.currentTimeMillis();
            while(inputData.hasNext())
            {
                String data=inputData.next();
                String[] values= data.split(",");
                String query = "INSERT INTO ut_timetable VALUES (";
                
                for(int i = 0; i < 11; i++) {
                    
                    if(i == 0){
                        query += "'" + values[i] + "'";
                    }else{
                        query += ",'" + values[i] + "'";
                    }
                         
                }
                
                query += ",'')";
                statement.addBatch(query);
               
            }
            statement.executeBatch();
           
            con.close();
            
            Long endTime = System.currentTimeMillis();
            
            out.println("TimeTaken : " + (endTime-startTime)/1000 + "s");
            
            //File Deleted
             out.println(file);
            file.delete();
            //---------//
            inputData.close();
            response.sendRedirect("Timetable.jsp");
            out.println("<h1>Data Fetched</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UploadData.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UploadData.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UploadData.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UploadData.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
  