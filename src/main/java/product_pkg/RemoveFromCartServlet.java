
package product_pkg;

import dbconnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RemoveFromCartServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    private DBConnection dbConn = new DBConnection();
    private ServletConfig sConf;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        productDAO = new ProductDAO(dbConn);
        sConf = config;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             if(request.getParameter("cartItemIdToRemove") != null) {
            try {
                productDAO.removeFromCart(Integer.parseInt(request.getParameter("cartItemIdToRemove")));
                
                out.write("done");
                
            } catch (SQLException ex) {
                Logger.getLogger(RemoveFromCartServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        }
       
    }
    
}
