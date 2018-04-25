/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Beans.ProductBean;
import dbconnection.ProductsDB;
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
@WebServlet(name = "DeleteProductServ", urlPatterns = {"/DeleteProductServ"})
public class DeleteProductServ extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDB productdb=new ProductsDB();
         System.out.print (" iam in delete Servelete");
        int id =Integer.parseInt(request.getParameter("prodcutid"));
         try {
            
            
            productdb.deleteProduct(id);
          
           RequestDispatcher fd=request.getRequestDispatcher("AllProdctSer");
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
