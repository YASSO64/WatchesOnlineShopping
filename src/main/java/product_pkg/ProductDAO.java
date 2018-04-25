package product_pkg;

import Beans.Cart;
import Beans.ProductBean;
import Beans.UserPaidProducts;
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

    public void addProductToCart(Cart cart) throws SQLException {
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement pst = (PreparedStatement) connection.prepareStatement(
                "insert into cart (user_id, product_id, item_quantity, total_price) values(?, ?, ?, ?)");
        pst.setInt(1, cart.getUser_id());
        pst.setInt(2, cart.getProduct_id());
        pst.setInt(3, cart.getTotal_items());
        pst.setInt(4, cart.getTotal_Price());
        pst.executeUpdate();

        System.out.println("product has been inserted into cart table");
    }

    public void updateCartProductQuantity(int prodId, int newQuantity) throws SQLException {
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement pst = (PreparedStatement) connection.prepareStatement(
                "update cart set item_quantity=" + newQuantity + " where product_id=" + prodId);
        pst.executeUpdate();

        System.out.println("cart product has been updated");
    }

    public List<ProductBean> getCartProducts(int userId) throws SQLException {
        List<ProductBean> cartProducts = new ArrayList<ProductBean>();
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement statement = (PreparedStatement) connection.prepareStatement(
                "SELECT p.id, p.product_name, p.product_price, p.product_image, p.brand_name, p.category_name, c.item_quantity"
                + " FROM products p, cart c where p.id=c.product_id and c.user_id=" + userId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            ProductBean product = new ProductBean();
            product.setId(resultSet.getInt("p.id"));
            product.setProductName(resultSet.getString("p.product_name"));
            product.setProductPrice(resultSet.getInt("p.product_price"));
            product.setImageName(resultSet.getString("p.product_image"));
            product.setProduct_brand(resultSet.getString("p.brand_name"));
            product.setProductCategory(resultSet.getString("p.category_name"));
            product.setProductQuantity(resultSet.getInt("c.item_quantity"));
            cartProducts.add(product);
        }
        System.out.println("cart products has been selected");
        return cartProducts;
    }

    public void removeFromCart(int cartItemId) throws SQLException {
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement pst = (PreparedStatement) connection.prepareStatement(
                "delete from cart where product_id=" + cartItemId);
        pst.executeUpdate();
        System.out.println("Cart Item has been Removed");
    }

    public void insertIntoUserPaidProds(UserPaidProducts paidProducts) throws SQLException {
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement pst = (PreparedStatement) connection.prepareStatement(
                "insert into user_paid_products (user_id, product_id, item_quantity, total_price) values(?, ?, ?, ?)");
        pst.setInt(1, paidProducts.getUser_id());
        pst.setInt(2, paidProducts.getProduct_id());
        pst.setInt(3, paidProducts.getTotal_items());
        pst.setInt(4, paidProducts.getTotal_Price());
        pst.executeUpdate();

        System.out.println("product has been inserted into userPaidProds table");
    }

    public void updateCreditLimit(String updatedBlanace, int userId) throws SQLException {
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement pst = (PreparedStatement) connection.prepareStatement(
                "update users set creditNumber=" + updatedBlanace + " where id=" + userId);
        pst.executeUpdate();
    }

    public void updateProductQuantity(int updatedQuantity, int prodId) throws SQLException {
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement pst = (PreparedStatement) connection.prepareStatement(
                "update products set product_quantity=" + updatedQuantity + " where id=" + prodId);
        pst.executeUpdate();

        System.out.println("product quantity has been updated");
    }

    public Cart getCart(int prodId) throws SQLException {

        Cart cart = null;
        Connection connection = (Connection) dbConn.getConnection();
        PreparedStatement statement = (PreparedStatement) connection.prepareStatement(
                "SELECT user_id, product_id, item_quantity, total_price from cart where product_id=" + prodId);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            cart = new Cart();
            cart.setUser_id(resultSet.getInt("user_id"));
            cart.setProduct_id(resultSet.getInt("product_id"));
            cart.setTotal_items(resultSet.getInt("item_quantity"));
            cart.setTotal_Price(resultSet.getInt("total_price"));
            System.out.println(""+resultSet.getInt("item_quantity"));
        }
        return cart;
    }

}
