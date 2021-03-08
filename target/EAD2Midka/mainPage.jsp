<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

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
        <h3 class="text-center">List of Products</h3>
        <hr>

        <div class="container text-left">

            <a href="/new"
               class="btn btn-success">ADD Product</a>


            <a href="CheckOrdersServlet"
               class="btn btn-info">CHECK ORDERS</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>

                <th>Product Id</th>
                <th>Product name</th>
                <th>Product description</th>
                <th>Product Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${products}">
                <tr>

                    <td><c:out value="${product.id}"/></td>
                    <td><c:out value="${product.name}"/></td>
                    <td><c:out value="${product.description}"/></td>
                    <td><c:out value="${product.price}$"/></td>
                    <td><a href="edit?id=<c:out value='${product.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<c:out value='${product.id}'/>">Delete</a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>