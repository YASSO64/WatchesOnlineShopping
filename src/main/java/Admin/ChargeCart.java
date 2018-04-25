/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Beans.User;
import dbconnection.ChargeCartDB;
import dbconnection.UsersDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rania
 */
@WebServlet(name = "ChargeCart", urlPatterns = {"/ChargeCart"})
public class ChargeCart extends HttpServlet {

   
  
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
      
       HttpSession session = request.getSession(true);
       User user1=new User();
       user1=(User) session.getAttribute("user");
       
       int user_id=user1.getId();
       String Creditlimit=request.getParameter("CartLimit");
       int newValue=Integer.parseInt(Creditlimit);
       int oldvalue=Integer.parseInt(user1.getCredit_number());
       int allvalue=newValue+oldvalue;
       user1.setCredit_number(Integer.toString(allvalue));
       session.setAttribute("user",user1);
              
       
         ChargeCartDB cartObj=new  ChargeCartDB();
         User user=new User();
         user.setCredit_number(Integer.toString(allvalue));
         System.out.println(allvalue);
         System.out.println(user_id);
         user.setId(user_id);
         response.sendRedirect("user-profile.jsp");
        try {
            cartObj.ChargCart(user);
        } catch (SQLException ex) {
            Logger.getLogger(ChargeCart.class.getName()).log(Level.SEVERE, null, ex);
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
