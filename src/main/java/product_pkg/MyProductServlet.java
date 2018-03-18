package product_pkg;

import Beans.ProductBean;
import dbconnection.DBConnection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyProductServlet extends HttpServlet {

    private ProductDAO productDAO;
    private DBConnection dbConn = new DBConnection();
    private ServletConfig sConf;
    private ServletContext servletContext;
    List<ProductBean> products;
    List<String> brands;
    List<ProductBean> searchedProds;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            products = productDAO.getProducts();
            brands = productDAO.getBrands();
            servletContext = sConf.getServletContext();

            servletContext.setAttribute("brands", brands);
            servletContext.setAttribute("products", products);
            
            if (request.getParameter("searchedInput") != null) {
                searchedProds = productDAO.getSearchedProductsByName(request.getParameter("searchedInput"));
                servletContext.setAttribute("searchedProducts", searchedProds);
            }
            
        } catch (SQLException e) {
            throw new ServletException("Cannot obtain products from DB", e);
        }
    }

}
