package com.midka;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class LoginServlet extends HttpServlet {
    private static final String URL = "jdbc:postgresql://localhost:5433/todo_db";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "123456";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();

            String name = request.getParameter("user");
            String password = request.getParameter("password");
            String dbName = null;
            String dbPassword = null;
            Long dbId = null;

            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);


            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Registration WHERE name=? and password=?");
            ps.setString(1, name);
            ps.setString(2, password);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()){
                dbId = resultSet.getLong("id");
                dbName = resultSet.getString("name");
                dbPassword = resultSet.getString("password");
            }

            if(name.equals(dbName) && password.equals(dbPassword)){
                Cookie ck=new Cookie("userId", String.valueOf(dbId));
                ck.setMaxAge(60 * 60);
                response.addCookie(ck);
                request.getRequestDispatcher("userMainPage.jsp").include(request, response);


            }else{
//                response.sendRedirect("login.jsp");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                requestDispatcher.include(request, response);
            }



            out.close();


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
