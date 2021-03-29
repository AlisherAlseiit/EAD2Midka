package com.midka;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class RegistrationServlet extends HttpServlet {
    private static final String URL = "jdbc:postgresql://localhost:5433/todo_db";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "123456";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();

            String name = request.getParameter("user");
            String password = request.getParameter("password");

            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);


            PreparedStatement ps = connection.prepareStatement("INSERT INTO Registration( name, password)  VALUES (?,?)");
            ps.setString(1, name);
            ps.setString(2, password);
            ps.executeUpdate();


            request.setAttribute("message", "success");
            request.getRequestDispatcher("login.jsp").include(request, response);


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
