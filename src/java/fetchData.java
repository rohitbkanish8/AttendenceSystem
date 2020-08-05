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

@MultipartConfig
/**
 *
 * @author kawal
 */
public class fetchData extends HttpServlet {

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
                throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet fetchData</title>");            
                out.println("</head>");
                out.println("<body>");

                String id=request.getParameter("ID");

                //Getting File Name
                Part part = request.getPart("File");
                String FileName=part.getSubmittedFileName();
                System.out.println(" ID : "+id);
                System.out.println("File Name : "+FileName);

                //Getting File Path

                String Path=request.getRealPath("/")+"file"+File.separator+part.getSubmittedFileName();
                System.out.println("File Path : "+Path);

                //Saving File To the Project 

                InputStream io=part.getInputStream();
                byte b[] =new byte[io.available()];
                io.read(b);
                FileOutputStream fos=new FileOutputStream(Path);
                fos.write(b);
                fos.flush();
                fos.close();

                //Fetching Data from the File

               //String fileName=part.getSubmittedFileName();
                File file=new File(Path);
                Scanner inputData=new Scanner(file);
                while(inputData.hasNext())
                {
                    String data=inputData.next();
                    out.println(data);
                }
                //File Deleted
    //            file.delete();
    //            //---------//
    //            inputData.close();

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
            processRequest(request, response);
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
            processRequest(request, response);
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
