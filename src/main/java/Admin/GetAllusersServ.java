/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Beans.User;
import dbconnection.UsersDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "GetAllusersView", urlPatterns = {"/GetAllusersView"})
public class GetAllusersServ extends HttpServlet {

   
  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        ArrayList<User>arrgetusers=new  ArrayList();
        UsersDB usersobj=new UsersDB();
        try {
             
            
            arrgetusers=usersobj.getAllusers();
           
            request.setAttribute("userslist", arrgetusers);
            RequestDispatcher fd=request.getRequestDispatcher("adminjsp/usersview.jsp");
              fd.include(request, response);
             
                    
        } catch (SQLException ex) {
            Logger.getLogger(GetAllusersServ.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                System.out.print("iam in the post");
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
