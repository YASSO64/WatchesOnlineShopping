package product_pkg;

import Beans.Cart;
import Beans.ProductBean;
import Beans.User;
import dbconnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddToCartServlet extends HttpServlet {

    private ProductDAO productDAO;
    private DBConnection dbConn = new DBConnection();
    private ServletConfig sConf;
    private List<ProductBean> products;
    private Cart cart = null;
    private int selected_quantity, cartProdId;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            System.out.println("selectedQuant: " + request.getParameter("cartProdQuantity"));
            System.out.println("prod Id: " + request.getParameter("cartProdId"));
            User user = (User) request.getSession().getAttribute("user");

            if ((request.getParameter("cartProdQuantity") != null) && (request.getParameter("cartProdId") != null)) {
                cartProdId = Integer.parseInt(request.getParameter("cartProdId"));
                if (request.getParameter("cartProdQuantity") != "") {
                    selected_quantity = Integer.parseInt(request.getParameter("cartProdQuantity"));
                } else {
                    selected_quantity = 1;
                }

                try {
                    cart = productDAO.getCart(cartProdId);
                } catch (SQLException ex) {
                    Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                if (cart == null) {
                    cart = new Cart();
                    cart.setProduct_id(cartProdId);
                    cart.setUser_id(user.getId());
                    cart.setTotal_items(selected_quantity);
                    cart.setTotal_Price(Integer.parseInt(request.getParameter("cartProdPrice")) * selected_quantity);
                    try {
                        productDAO.addProductToCart(cart);
                        //out.write("done");
                    } catch (SQLException ex) {
                        Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    try {
                        productDAO.updateCartProductQuantity(cartProdId, selected_quantity);
                        //out.write("done");
                    } catch (SQLException ex) {
                        Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
                out.write("done");
                System.out.println("product id cart: " + cartProdId);
            }
            
            else {
                System.out.println("product hasn't been inserted");
            }
        }

    }

}
