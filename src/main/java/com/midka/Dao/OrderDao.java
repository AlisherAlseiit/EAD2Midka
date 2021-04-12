//package com.midka.Dao;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//public class OrderDao  {
//
//    private static final String URL = "jdbc:postgresql://localhost:5433/todo_db";
//    private static final String USERNAME = "postgres";
//    private static final String PASSWORD = "123456";
//    private static Connection connection;
//
//
//    static {
//        try {
//            Class.forName("org.postgresql.Driver");
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//
//        try {
//            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }
//
//}
