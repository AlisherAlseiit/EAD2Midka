<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Orders</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: black">
        <div>
            <a href="" class="navbar-brand"> Product
                App</a>
        </div>

        <ul class="navbar-nav">
            <li><a href="/list"
                   class="nav-link">Products</a></li>
        </ul>


        <ul class="navbar-nav navbar-collapse justify-content-end">
            <li><a href="AdminLogoutServlet"
                   class="nav-link">Logout</a></li>
        </ul>
    </nav>
</header>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Orders</h3>
        <hr>

        <br>
        <table class="table table-bordered">
            <thead>
            <tr>

                <th>Order Id</th>
                <th>Buyer Id</th>
                <th>Product Id</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td><c:out value="${order.orderId}"/></td>
                    <td><c:out value="${order.buyerName}"/></td>
                    <td><c:out value="${order.productName}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>



















