package product_pkg;

import Beans.ProductBean;
import dbconnection.DBConnection;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SingleProductServlet extends HttpServlet {

    private ProductDAO productDAO;
    private DBConnection dbConn = new DBConnection();
    private ServletConfig sConf;
    private ServletContext servletContext;
    List<ProductBean> products;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getParameter("id"));

        products = (List<ProductBean>) sConf.getServletContext().getAttribute("products");
        for (ProductBean prod : products) {
            if (prod.getId() == Integer.parseInt(request.getParameter("id"))) {
                request.setAttribute("singleProduct", prod);
            }
        }
    }
}
