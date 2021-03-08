package com.midka;

import com.midka.model.Order;
import com.midka.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckOrdersServlet")
public class CheckOrdersServlet extends HttpServlet {

    private static final String URL = "jdbc:postgresql://localhost:5433/todo_db";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "123456";
    private static Connection connection;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

        List<Order> orders = new ArrayList<>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Ord ORDER BY orderId asc");
            while (resultSet.next()){
                Order order = new Order();


                Long registrationID = resultSet.getLong("registration_id");
                Long productId = resultSet.getLong("product_id");

                //
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT name from Registration where id=?");

                preparedStatement.setLong(1, registrationID);

                ResultSet resultSet1 = preparedStatement.executeQuery();

                resultSet1.next();


                order.setBuyerName(resultSet1.getString("name"));

                PreparedStatement preparedStatement2= connection.prepareStatement("SELECT name from Product where id=?");

                preparedStatement2.setLong(1, productId);

                ResultSet resultSet2 = preparedStatement2.executeQuery();

                resultSet2.next();



                order.setOrderId(resultSet.getLong("orderId"));
                order.setProduct_id(resultSet.getLong("product_id"));
                order.setRegistration_id(resultSet.getLong("registration_id"));
                order.setProductName(resultSet2.getString("name"));
                orders.add(order);
            }


            request.setAttribute("orders", orders);
            request.getRequestDispatcher("ordersPage.jsp").include(request, response);



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }
}
