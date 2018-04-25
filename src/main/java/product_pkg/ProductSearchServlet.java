package product_pkg;

import Beans.Cart;
import Beans.ProductBean;
import Beans.User;
import dbconnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductSearchServlet extends HttpServlet {

    private ProductDAO productDAO;
    private DBConnection dbConn = new DBConnection();
    private ServletConfig sConf;
    List<ProductBean> products, categorizedProducts;
    List<String> brands;
    private int selected_quantity, cartProdId;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            System.out.println(request.getParameter("category"));
            products = (List<ProductBean>) sConf.getServletContext().getAttribute("products");
            categorizedProducts = new ArrayList<ProductBean>();
            for (ProductBean prod : products) {
                if (prod.getProductCategory().equals(request.getParameter("category"))) {
                    categorizedProducts.add(prod);
                }
            }
            request.setAttribute("prodsByCategory", categorizedProducts);
            
            System.out.println("categorizd prods length:" + categorizedProducts.size());

            brands = (List<String>) sConf.getServletContext().getAttribute("brands");
            request.setAttribute("brands", brands);

    }
}
