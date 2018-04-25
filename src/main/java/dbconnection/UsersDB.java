/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import Beans.User;
import com.mysql.jdbc.PreparedStatement;
import static dbconnection.DBConnection.db;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Rania
 */
public class UsersDB {

    ArrayList<User> arrgetusers = new ArrayList();

    PreparedStatement stmt = null;
    DBConnection db;

    ResultSet rsesultset = null;

    public ArrayList<User> getAllusers() throws SQLException {
        db = DBConnection.getDbCon();
        Connection conn = db.getConnection();

        String query = "select * from users where type_flag = ?";

        stmt = (PreparedStatement) conn.prepareStatement(query);
        stmt.setString(1, "user");

        rsesultset = stmt.executeQuery();

        while (rsesultset.next()) {
            User user = new User();

            user.setId(rsesultset.getInt(1));

            user.setUser_name(rsesultset.getString(2));

            user.setPassword(rsesultset.getString(3));

            user.setUser_email(rsesultset.getString(4));

            user.setBirthDate(rsesultset.getString(5));

            user.setUser_job(rsesultset.getString(6));

            user.setCredit_number(rsesultset.getString(7));
            user.setProfile_pic(rsesultset.getString(8));
            user.setUser_address(rsesultset.getString(9));

            arrgetusers.add(user);

        }

        System.out.print(arrgetusers.get(0).getUser_name());
        stmt.close();
        conn.close();
        return arrgetusers;
    }

    public User getUser(int id) throws SQLException {

        db = DBConnection.getDbCon();
        Connection conn = db.getConnection();

        String query = "select * from users where id = ?";

        stmt = (PreparedStatement) conn.prepareStatement(query);
        stmt.setInt(1, id);

        rsesultset = stmt.executeQuery();
        User user = new User();

        if (rsesultset.next()) {

            user.setId(rsesultset.getInt(1));

            user.setUser_name(rsesultset.getString(2));

            user.setPassword(rsesultset.getString(3));

            user.setUser_email(rsesultset.getString(4));

            user.setBirthDate(rsesultset.getString(5));

            user.setUser_job(rsesultset.getString(6));

            user.setCredit_number(rsesultset.getString(7));

            user.setProfile_pic(rsesultset.getString(9));

            user.setUser_address(rsesultset.getString(10));

        }
        stmt.close();
        conn.close();
        return user;

    }

    public void insertUser(User user) throws SQLException {
        db = DBConnection.getDbCon();
        Connection conn = db.getConnection();
        stmt = (PreparedStatement) conn.prepareStatement("INSERT into users (user_name,password,user_email,birthday,user_job,creditNumber,profile_pic,address)" + "VALUES(?,?,?,?,?,?,?,?)");

        stmt.setString(1, user.getUser_name());
        stmt.setString(2, user.getPassword());
        stmt.setString(3, user.getUser_email());
        stmt.setString(4, user.getBirthDate());
        stmt.setString(5, user.getUser_job());
        stmt.setString(6, user.getCredit_number());
        stmt.setString(7, user.getProfile_pic());
        stmt.setString(8, user.getUser_address());

        stmt.executeUpdate();
        System.out.println("Insert user");
        stmt.close();

        conn.close();

    }

    public void UpdateUser(User user) throws SQLException {
        db = DBConnection.getDbCon();
        Connection conn = db.getConnection();
        String myquery = "update users"
                + " set user_name=?,password=?,user_email=?,birthday=?,user_job=?,creditNumber=?,profile_pic=?,address=?"
                + "where id=?";
        PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(myquery);

        stmt.setString(1, user.getUser_name());
        stmt.setString(2, user.getPassword());
        stmt.setString(3, user.getUser_email());
        stmt.setString(4, user.getBirthDate());
        stmt.setString(5, user.getUser_job());
        stmt.setString(6, user.getCredit_number());
        stmt.setString(7, user.getProfile_pic());
        stmt.setString(8, user.getUser_address());

        stmt.setInt(9, user.getId());

        stmt.executeUpdate();
        System.out.println("User Updated userid" + user.getId());
        stmt.close();

        conn.close();
    }

}
