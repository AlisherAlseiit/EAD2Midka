package com.midka;

import com.midka.Dao.ProductDao;
import com.midka.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class ProductControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1;
    private ProductDao productDao;


    public void init() {
        productDao = new ProductDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getServletPath();


        switch (action) {
            case "/new":
                showNewForm(request, response);
                break;
            case "/insert":
                try {
                    insertProduct(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/delete":
                try {
                    deleteProduct(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/edit":
                try {
                    showEditForm(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/update":
                try {
                    updateProduct(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/list":
                try {
                    listProduct(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/userList":
                try {
                    userListProduct(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "/buy":
                try {
                    addOrder(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
                break;
        }


    }


    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> listProduct = productDao.selectAllProducts();


        request.setAttribute("products", listProduct);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("mainPage.jsp");
        requestDispatcher.forward(request, response);
    }

    private void userListProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> listProduct = productDao.selectAllProducts();

        request.setAttribute("products", listProduct);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("userMainPage.jsp");
        requestDispatcher.forward(request, response);
    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("productAdd.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productDao.selectProduct(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("productAdd.jsp");
        request.setAttribute("product", existingProduct);
        requestDispatcher.forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));


        Product newProduct = new Product(name, description, price);
        productDao.insertProduct(newProduct);
        response.sendRedirect("list");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        long id = Long.parseLong(request.getParameter("id"));

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));

        Product newProduct = new Product(id, name, description, price);

        productDao.updateProducts(newProduct);


        response.sendRedirect("list");
    }


    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        long id = Long.parseLong(request.getParameter("id"));


        productDao.delete(id);
        response.sendRedirect("list");


    }


    private void addOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        Cookie ck[] = request.getCookies();
        long id = Long.parseLong(request.getParameter("id"));

        if (ck != null) {
            int i = 0;
            while (!ck[i].getName().equals("userId")) {
                i++;
            }

            String userId = ck[i].getValue();
            productDao.createOrder(id, Long.parseLong(userId));
            response.sendRedirect("userList");


        }
    }

}
