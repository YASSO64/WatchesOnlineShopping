/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import Beans.ProductBean;
import Beans.User;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Rania
 */
public class ProductsDB {
    PreparedStatement stmt = null;
    DBConnection db;
    Connection conn;

    ResultSet rsesultset = null;
    //---------------------------------get all products ----------------------
    public ArrayList<ProductBean> getProducts() throws SQLException {
         ArrayList<ProductBean> products=new  ArrayList<ProductBean>();
         
        db = DBConnection.getDbCon();
        conn = db.getConnection();
        String query = "select * from products";

        stmt = (PreparedStatement) conn.prepareStatement(query);
        rsesultset = stmt.executeQuery();
        while (rsesultset.next()) {
           ProductBean product = new ProductBean();
            product.setId(rsesultset.getInt("id"));
            product.setProductName(rsesultset.getString("product_name"));
            product.setProductPrice(rsesultset.getInt("product_price"));
            product.setImageName(rsesultset.getString("product_image"));
            product.setProduct_brand(rsesultset.getString("brand_name"));
            product.setProductCategory(rsesultset.getString("category_name"));
            products.add(product);
        }
        stmt.close();
        conn.close();

        return products;
    }
    //-------------------------get product ------------------------------
    public ProductBean getProduct(int id) throws SQLException
    {
         db = DBConnection.getDbCon();
         conn = db.getConnection();

        String query = "select * from products where id = ?";

        stmt = (PreparedStatement) conn.prepareStatement(query);
        stmt.setInt(1, id);

        rsesultset = stmt.executeQuery();
        ProductBean product=new ProductBean();
        if(rsesultset.next())
        {
         product.setId(rsesultset.getInt(1));
         product.setProductName(rsesultset.getString(2));
         product.setProductPrice(rsesultset.getInt(3));
         product.setProductQuantity(rsesultset.getInt(4));
         product.setImageName(rsesultset.getString(5));
         product.setProductCategory(rsesultset.getString(6));
         product.setProduct_brand(rsesultset.getString(7));
       
        }
         stmt.close();
         conn.close();
        return product;
    }
    //----------------------------------delete product --------------------------------
    public void deleteProduct(int id) throws SQLException
    {
        db = DBConnection.getDbCon();
        conn = db.getConnection();

        String query = "delete from products where id = ?";

        stmt = (PreparedStatement) conn.prepareStatement(query);
        stmt.setInt(1, id);

        stmt.executeUpdate();
        System.out.print(" product deleted ");
        stmt.close();
        conn.close();
    
        
    }
    //-----------------------------------add product ----------------------------------
    public void AddProduct(ProductBean product) throws SQLException
    {
         db= DBConnection.getDbCon();
         conn=db.getConnection();
       
           
               
	 PreparedStatement stmt = (PreparedStatement) conn.prepareStatement("INSERT into products (product_name,product_price,product_quantity,product_image,category_name,brand_name)"+"VALUES(?,?,?,?,?,?)");
                   
                     stmt.setString(1,product.getProductName());
                     stmt.setInt(2,product.getProductPrice());
                     stmt.setInt(3,product.getProductQuantity());
                     stmt.setString(4,product.getImageName());
                     stmt.setString(5,product.getProductCategory());
                     stmt.setString(6,product.getProduct_brand());
                     stmt.executeUpdate();
                     System.out.println("Insert product");
                     stmt.close();
                     conn.close();      
    }
    //------------------------------update Product -----------------
    public void UpdateProduct(ProductBean product) throws SQLException
    {
         db= DBConnection.getDbCon();
         conn=db.getConnection();
         String myquery="update products" 
                 +" set product_name=?,product_price=?,product_quantity=?,product_image=?,category_name=?,brand_name=?"
                 +"where id=?";
          PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(myquery);
                     stmt.setString(1,product.getProductName());
                     stmt.setInt(2,product.getProductPrice());
                     stmt.setInt(3,product.getProductQuantity());
                     stmt.setString(4,product.getImageName());
                     stmt.setString(5,product.getProductCategory());
                     stmt.setString(6,product.getProduct_brand());
                     stmt.setInt(7, product.getId());
                     stmt.executeUpdate();
                     System.out.println("Product updated");
                     stmt.close();
                     conn.close();      
    }
        
        
    
}
    
   
         
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
