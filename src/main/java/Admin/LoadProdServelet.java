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
@WebServlet(name = "LoadProduct", urlPatterns = {"/LoadProduct"})
public class LoadProdServelet extends HttpServlet {

    
   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       ProductsDB productdb=new ProductsDB();
       int id =Integer.parseInt(request.getParameter("prodcutid"));
       ProductBean product=new ProductBean();
        try {
            product= productdb.getProduct(id);
            request.setAttribute("product",product);
            RequestDispatcher fd=request.getRequestDispatcher("adminjsp/UpdateProduct.jsp");
            fd.forward(request, response);
                    
        } catch (SQLException ex) {
            Logger.getLogger(LoadProdServelet.class.getName()).log(Level.SEVERE, null, ex);
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
