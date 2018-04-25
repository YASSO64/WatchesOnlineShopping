/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Beans.User;
import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import dbconnection.UsersDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rania
 */
@WebServlet(name = "UserProfileServ", urlPatterns = {"/UserProfileServ"})
public class UserProfileServ extends HttpServlet {

    
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           UsersDB usersobj=new UsersDB();
           int id =Integer.parseInt(request.getParameter("userid"));
                  
        try {
            User user=usersobj.getUser(id);
            request.setAttribute("user",user );
            RequestDispatcher fd=request.getRequestDispatcher("adminjsp/userProfile.jsp");
              fd.include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserProfileServ.class.getName()).log(Level.SEVERE, null, ex);
        }
          
           
            
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
