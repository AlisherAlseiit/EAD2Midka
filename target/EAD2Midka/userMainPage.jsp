<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

</head>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: black">
        <div>
            <a href="" class="navbar-brand"> Product
                App</a>
        </div>

        <ul class="navbar-nav">
            <li><a href="/userList"
                   class="nav-link">Products</a></li>
        </ul>


        <ul class="navbar-nav navbar-collapse justify-content-end">
            <li><a href="LogoutServlet"
                   class="nav-link">Logout</a></li>
        </ul>
    </nav>
</header>


<div class="row">
    <div class="container">
        <h3 class="text-center">List of Products</h3>
        <%
            String name = "name: " + request.getAttribute("userName");

            if (request.getAttribute("userName") == null) {

                name = "";
            }


        %>
        <p style="color:green"><% out.println(name);%></p>

        <hr>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>

                <th>Product name</th>
                <th>Product description</th>
                <th>Product Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${products}">
                <tr>

                    <td><c:out value="${product.name}"/></td>
                    <td><c:out value="${product.description}"/></td>
                    <td><c:out value="${product.price}$"/></td>
                    <td><a href="/buy?id=<c:out value='${product.id}' />">Buy</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <p><c:out value="${message}"/></p>
    </div>
</div>
</body>
</html>