package product_pkg;

import Beans.ProductBean;
import dbconnection.DBConnection;
import java.sql.*;
import java.util.*;

public class ProductDAO {

    private DBConnection dbConn;

    public ProductDAO(DBConnection dbConn) {
        this.dbConn = dbConn;
    }

    public List<ProductBean> getProducts() throws SQLException {
        
        List<ProductBean> products = new ArrayList<ProductBean>();
        Connection connection = (Connection) dbConn.getConnection();
        
        PreparedStatement statement = (PreparedStatement) connection.prepareStatement(
                "SELECT id, product_name, product_price, product_image, brand_name, category_name, product_quantity"
                        + " FROM products");
        ResultSet resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            ProductBean product = new ProductBean();
            product.setId(resultSet.getInt("id"));
            product.setProductName(resultSet.getString("product_name"));
            product.setProductPrice(resultSet.getInt("product_price"));
            product.setImageName(resultSet.getString("product_image"));
            product.setProduct_brand(resultSet.getString("brand_name"));
            product.setProductCategory(resultSet.getString("category_name"));
            product.setProductQuantity(resultSet.getInt("product_quantity"));
            products.add(product);
        }

        return products;
    }

    public List<String> getBrands() throws SQLException {

        List<String> brands = new ArrayList<String>();
        String brand = null;

        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement statement = (PreparedStatement) connection.prepareStatement(
                "SELECT DISTINCT brand_name FROM products");
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            brand = resultSet.getString("brand_name");
            brands.add(brand);
        }

        return brands;
    }

    public List<ProductBean> getSearchedProductsByName(String SearchedProdName) throws SQLException {

        List<ProductBean> searchproducts = new ArrayList<ProductBean>();

        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement statement = (PreparedStatement) connection.prepareStatement(
                "SELECT id, product_name, product_price, product_image, brand_name,"
                        + "category_name, product_quantity FROM products"
                        + " WHERE product_name like '%" + SearchedProdName + "%'");
     
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            ProductBean product = new ProductBean();
            product.setId(resultSet.getInt("id"));
            product.setProductName(resultSet.getString("product_name"));
            product.setProductPrice(resultSet.getInt("product_price"));
            product.setImageName(resultSet.getString("product_image"));
            product.setProduct_brand(resultSet.getString("brand_name"));
            product.setProductCategory(resultSet.getString("category_name"));
            product.setProductQuantity(resultSet.getInt("product_quantity"));
            searchproducts.add(product);
        }

        return searchproducts;
    }
    
    public void addProductToCart(ProductBean product, int selected_quantity) throws SQLException {
        
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement pst = (PreparedStatement) connection.prepareStatement(
                "insert into cart (user_id, product_id, item_quantity, total_price) values(?, ?, ?, ?)");
        
        pst.setInt(1, 1);
        pst.setInt(2, product.getId());
        pst.setInt(3, selected_quantity);
        pst.setInt(4, selected_quantity * product.getProductPrice());
        pst.executeUpdate();
        
        System.out.println("product has been inserted into cart table");
    }
    
    public List<ProductBean> getCartProducts(int cartProductId, int userId) throws SQLException {
        
        List<ProductBean> cartProducts = new ArrayList<ProductBean>();
        Connection connection = (Connection) dbConn.getConnection();
        
        PreparedStatement statement = (PreparedStatement) connection.prepareStatement(
                "SELECT id, product_name, product_price, product_image, brand_name, category_name, cart.item_quantity"
                        + " FROM products, cart where products.id=" + cartProductId + " and user_id=" + userId);
        ResultSet resultSet = statement.executeQuery();
        
        while (resultSet.next()) {
            ProductBean product = new ProductBean();
            product.setId(resultSet.getInt("id"));
            product.setProductName(resultSet.getString("product_name"));
            product.setProductPrice(resultSet.getInt("product_price"));
            product.setImageName(resultSet.getString("product_image"));
            product.setProduct_brand(resultSet.getString("brand_name"));
            product.setProductCategory(resultSet.getString("category_name"));
            product.setProductQuantity(resultSet.getInt("item_quantity"));
            cartProducts.add(product);
        }

        return cartProducts;
    }
}
