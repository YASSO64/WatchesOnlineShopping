package product_pkg;

import Beans.ProductBean;
import dbconnection.DBConnection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartManipulationServlet extends HttpServlet {

    private ProductDAO productDAO;
    private DBConnection dbConn = new DBConnection();
    private ServletConfig sConf;
    private ServletContext servletContext;
    private List<ProductBean> products, cartProducts;
    private int selected_quantity;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        products = (List<ProductBean>) sConf.getServletContext().getAttribute("products");
        servletContext = sConf.getServletContext();

        System.out.println("selectedQuant: " + request.getParameter("cartProdQuantity"));
        System.out.println("prod Id: " + request.getParameter("cartProdId"));

        if ((request.getParameter("cartProdQuantity") != null) && (request.getParameter("cartProdId") != null)) {

            if (request.getParameter("cartProdQuantity") != "") {
                selected_quantity = Integer.parseInt(request.getParameter("cartProdQuantity"));
            } else {
                selected_quantity = 1;
            }
            
            for (ProductBean prod : products) {
                if (prod.getId() == Integer.parseInt(request.getParameter("cartProdId"))) {
                    try {
                        productDAO.addProductToCart(prod, selected_quantity);
                    } catch (SQLException ex) {
                        Logger.getLogger(CartManipulationServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }

        }
    }

}
