/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import Beans.User;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Rania
 */
public class ChargeCartDB {

    PreparedStatement stmt = null;
    DBConnection db;

    ResultSet rsesultset = null;

    public void ChargCart(User user) throws SQLException {
        db = DBConnection.getDbCon();
        Connection conn = db.getConnection();
        String myquery = "update users"
                + " set creditNumber=?"
                + "where id=?";
        PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(myquery);
        stmt.setString(1, user.getCredit_number());

        stmt.setInt(2, user.getId());

        stmt.executeUpdate();
        System.out.println("Charge Cart");
        stmt.close();

    }

}
