
package User;

import Beans.User;
import dbconnection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
    
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DBConnection db;
            String email = request.getParameter("email");
            String password = request.getParameter("psw");
//            String email = "shimaa@gmail.com";
//            String password = "shimaa@12345";
            HttpSession session = request.getSession(true);
            try {
                db = DBConnection.getDbCon();
                Connection conn = db.getConnection();
                PreparedStatement stmt = conn.prepareStatement("select * from users where user_email = ? and password = ?");
                
                stmt.setString(1, email);
                stmt.setString(2, password);
                stmt.executeQuery();
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {                    
                    System.out.println(">>>>>inside while");
                    System.out.println(rs.getString("user_name"));
                    //create user obj using incoming data
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUser_name(rs.getString("user_name"));
                    user.setUser_email(rs.getString("user_email"));
                    user.setUser_job(rs.getString("user_job"));
                    user.setPassword(rs.getString("password"));
                    user.setBirthDate(rs.getString("birthday"));
                    user.setCredit_number(rs.getString("creditNumber"));
                    user.setProfile_pic(rs.getString("profile_pic"));
                    user.setType(rs.getString("type_flag"));
                    user.setUser_address(rs.getString("address"));
                    
                    session.setAttribute("user",user);
//                    session.setAttribute("user_name",user.getUser_name());
//                    session.setAttribute("user_email",user.getUser_email());
                    System.out.println(((User)session.getAttribute("user")).getUser_name());
                    out.write(user.getType());
                    
                }
                
                stmt.close();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                
            }
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
