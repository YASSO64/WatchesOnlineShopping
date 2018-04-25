package product_pkg;

import Beans.ProductBean;
import Beans.User;
import Beans.UserPaidProducts;
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

public class BuyServlet extends HttpServlet {

    private ProductDAO productDAO;
    private DBConnection dbConn = new DBConnection();
    private ServletConfig sConf;
     private List<ProductBean> products;
     int updatedQuantity ;

    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if ((request.getParameter("prodId") != null) && (request.getParameter("prodQuantity") != null)
                    && (request.getParameter("prodPrice") != null)) {
                int totalPrice= Integer.parseInt(request.getParameter("prodPrice")) * Integer.parseInt(request.getParameter("prodQuantity"));
                User user = (User) request.getSession().getAttribute("user");
               
                boolean valid = (Integer.parseInt(user.getCredit_number()) >= totalPrice);
                if(valid) {
                    UserPaidProducts paidProducts = new UserPaidProducts();
                    paidProducts.setProduct_id(Integer.parseInt(request.getParameter("prodId")));
                    paidProducts.setTotal_items(Integer.parseInt(request.getParameter("prodQuantity")));
                    paidProducts.setTotal_Price(
                            Integer.parseInt(request.getParameter("prodPrice")) * Integer.parseInt(request.getParameter("prodQuantity")));
                    paidProducts.setUser_id(user.getId());
                    int updatedBalance = Integer.parseInt(user.getCredit_number()) - totalPrice;

                    products = (List<ProductBean>) sConf.getServletContext().getAttribute("products");
                    for (ProductBean prod : products) {
                        if (prod.getId() == Integer.parseInt(request.getParameter("prodId"))) {
                            updatedQuantity = prod.getProductQuantity() - Integer.parseInt(request.getParameter("prodQuantity"));
                        }
                    }
                    try {
                        productDAO.insertIntoUserPaidProds(paidProducts);
                        productDAO.removeFromCart(Integer.parseInt(request.getParameter("prodId")));
                        productDAO.updateCreditLimit("" + updatedBalance, user.getId());
                        productDAO.updateProductQuantity(updatedQuantity, Integer.parseInt(request.getParameter("prodId")));
                        out.write("valid");
                        System.out.println("inserted from buy servlet");
                    } catch (SQLException ex) {
                        Logger.getLogger(BuyServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else{
                    out.write("invalid");
                    System.out.println("not enough balance");
                }
            }
        }
    }

}
