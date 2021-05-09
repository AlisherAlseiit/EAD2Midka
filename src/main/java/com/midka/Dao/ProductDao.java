package com.midka.Dao;

import com.midka.model.Product;

import javax.servlet.http.Cookie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    private static final String URL = "jdbc:postgresql://localhost:5433/todo_db";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "123456";
    private static Connection connection;




    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void insertProduct(Product product) throws SQLException {

        PreparedStatement preparedStatement =
                connection.prepareStatement("INSERT INTO Product(name, description, price, img) VALUES (?, ?, ?, ?)");

        preparedStatement.setString(1, product.getName());
        preparedStatement.setString(2,product.getDescription());
        preparedStatement.setDouble(3, product.getPrice());
        preparedStatement.setString(4, product.getImg());

        preparedStatement.executeUpdate();
    }

    public Product selectProduct(long productId) throws SQLException {
        Product product = null;

        PreparedStatement preparedStatement =
                connection.prepareStatement("SELECT * FROM Product WHERE id=?");


        preparedStatement.setLong(1,productId);

        ResultSet resultSet = preparedStatement.executeQuery();

        resultSet.next();

        product = new Product();

        product.setId(resultSet.getLong("id"));
        product.setName(resultSet.getString("name"));
        product.setDescription(resultSet.getString("description"));
        product.setImg(resultSet.getString("img"));
        product.setPrice(resultSet.getInt("price"));


        return product;

    }


    public List<Product> selectAllProducts() throws SQLException {

        List<Product> products = new ArrayList<>();

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM Product ORDER  BY id asc ");


        while (resultSet.next()){
            Product product = new Product();

            product.setId(resultSet.getLong("id"));
            product.setName(resultSet.getString("name"));
            product.setDescription(resultSet.getString("description"));
            product.setImg(resultSet.getString("img"));
            product.setPrice(resultSet.getInt("price"));

            products.add(product);
        }

        return products;
    }


    public boolean delete(Long id) throws SQLException {
        PreparedStatement preparedStatement = null;
        boolean rowUpdated;



        preparedStatement = connection.prepareStatement("DELETE FROM Product WHERE id=?");

        preparedStatement.setLong(1,id);



        rowUpdated  = preparedStatement.executeUpdate() > 0;

        return rowUpdated;
    }


    public boolean updateProducts(Product product) throws SQLException {
        boolean rowUpdated;
        PreparedStatement preparedStatement =
                connection.prepareStatement("UPDATE Product SET name=?, description=?, price=?, img=? WHERE id=?");

        preparedStatement.setString(1, product.getName());
        preparedStatement.setString(2, product.getDescription());
        preparedStatement.setDouble(3, product.getPrice());
        preparedStatement.setString(4, product.getImg());
        preparedStatement.setLong(5, product.getId());

        rowUpdated = preparedStatement.executeUpdate() > 0;

        return rowUpdated;
    }


    public void createOrder(Long productId, Long userId) throws SQLException {

        PreparedStatement preparedStatement =
                connection.prepareStatement("INSERT INTO Ord(registration_id, product_id) VALUES (?, ?)");

        preparedStatement.setLong(1, userId);
        preparedStatement.setLong(2,productId);

        preparedStatement.executeUpdate();

    }





}
