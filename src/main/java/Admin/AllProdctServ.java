/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Beans.ProductBean;
import Beans.User;
import dbconnection.ProductsDB;
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
@WebServlet(name = "AllProdctSer", urlPatterns = {"/AllProdctSer"})
public class AllProdctServ extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<ProductBean> productlist = new ArrayList();
        ProductsDB proObject = new ProductsDB();

        try {

            productlist = proObject.getProducts();

            request.setAttribute("productlist", productlist);
            RequestDispatcher fd = request.getRequestDispatcher("adminjsp/productsView.jsp");
            fd.include(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(GetAllusersServ.class.getName()).log(Level.SEVERE, null, ex);
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
