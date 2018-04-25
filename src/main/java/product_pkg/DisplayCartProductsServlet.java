package product_pkg;

import Beans.ProductBean;
import Beans.User;
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
import javax.servlet.http.HttpSession;

public class DisplayCartProductsServlet extends HttpServlet {

    private ProductDAO productDAO;
    private ServletConfig sConf;
    private DBConnection dbConn = new DBConnection();
    private List<ProductBean> cartProducts;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        HttpSession session = request.getSession(true);

        try {
            cartProducts = productDAO.getCartProducts(user.getId());
            System.out.println("cart prods length: " + cartProducts.size());
            session.setAttribute("cartProducts", cartProducts);
        } catch (SQLException ex) {
            Logger.getLogger(DisplayCartProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
