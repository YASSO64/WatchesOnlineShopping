/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import dbconnection.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Rania
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

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
            out.println("<title>Servlet SignUp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    { 
      Date date = null; 
      DBConnection db;
      String username=request.getParameter("username");
      String password=request.getParameter("psw");
      String email=request.getParameter("email");
      String creditnumber=request.getParameter("creditnumber");
      String userjob=request.getParameter("job");
      //String imagename=request.getParameter("");
      //Part filePart = request.getPart("myimg"); 
       // if (filePart != null) {            
        //  InputStream inputStream = filePart.getInputStream();
        //}
         //String birthdate=request.getParameter("birthday");
         //DateFormat format = new SimpleDateFormat("yyyy,MM,DD", Locale.ENGLISH);
        // date=new Date();
  
  
        try {
            db= DBConnection.getDbCon();
            Connection conn=db.getConnection();
           
               
	     PreparedStatement stmt = conn.prepareStatement("INSERT into users (user_name,password,user_email,birthday,user_job,creditNumber)"+"VALUES(?,?,?,?,?,?)");
                   
                     stmt.setString(1,username);
                     stmt.setString(2,password);
                     stmt.setString(3,email);
                     stmt.setDate(4,null);
                     stmt.setString(5, userjob);
                     stmt.setString(6,creditnumber);
                     stmt.executeUpdate();
                    System.out.println("Insert user");
                    stmt.close();
             
                  conn.close();
            
            
    
        } catch (SQLException ex) {
            ex.printStackTrace();
          
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
