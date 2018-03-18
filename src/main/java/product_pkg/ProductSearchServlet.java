
package product_pkg;

import Beans.ProductBean;
import dbconnection.DBConnection;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
        
        brands = (List<String>) sConf.getServletContext().getAttribute("brands");
        request.setAttribute("brands", brands); 
        
 
    }
}
