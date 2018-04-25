/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import Beans.ProductBean;
import dbconnection.ProductsDB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Rania
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
public class AddProductServ extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String pname = null;
            String pcategory = null;
            String pbrand = null;
            String imagename = null;
            int product_price = 0;
            int product_Quantity = 0;
            ProductBean product = new ProductBean();
            //--------------------------------------------

            String path = request.getServletContext().getRealPath("") + "\\images\\";
            System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk" + path);

            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            List<FileItem> items;

            items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();

            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (item.isFormField()) {
                    if (item.getFieldName().equals("prodname")) {
                        pname = item.getString();
                        System.out.print("product name" + pname);
                    }

                    if (item.getFieldName().equals("selectcategory")) {
                        pcategory = item.getString();
                        System.out.print("category" + pcategory);
                    }
                    if (item.getFieldName().equals("select brand")) {
                        pbrand = item.getString();
                        System.out.print("Brand" + pbrand);
                    }
                    if (item.getFieldName().equals("pnumber")) {
                        product_price = Integer.parseInt(item.getString());
                        System.out.print("price" + product_price);
                    }
                    if (item.getFieldName().equals("number")) {
                        product_Quantity = Integer.parseInt(item.getString());
                        System.out.print("Quantity" + product_Quantity);
                    }

                } else {
                    if (!item.isFormField()) {

                        imagename = "images/" + item.getName();

                        item.write(new File(path + item.getName()));
                    }
                }
            }

            //----------------------------------
            product.setImageName(imagename);
            product.setProductName(pname);
            product.setProductCategory(pcategory);
            product.setProductPrice(product_price);
            product.setProductQuantity(product_Quantity);
            product.setProduct_brand(pbrand);
            ProductsDB producDB = new ProductsDB();
            try {
                producDB.AddProduct(product);
                System.out.println("product entered ");
                response.sendRedirect("AllProdctSer");

            } catch (SQLException ex) {
                Logger.getLogger(AddProductServ.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (FileUploadException ex) {
            Logger.getLogger(AddProductServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(AddProductServ.class.getName()).log(Level.SEVERE, null, ex);
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
