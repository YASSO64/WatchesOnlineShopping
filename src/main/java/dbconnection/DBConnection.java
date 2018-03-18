/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


 
public class DBConnection {

   
    public static DBConnection db;
    public static final String URL = "jdbc:mysql://localhost:3306/shoesdb";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "root";
     private  Connection connection;
     public  Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }
     // create one object of database single tone design pattern
    public static synchronized DBConnection getDbCon() {
        if ( db == null ) {
            db = new DBConnection();
        }
        return db;
 
    }
}
