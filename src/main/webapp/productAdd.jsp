<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false"%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: black">
        <div>
            <a href="" class="navbar-brand"> Todo
                App</a>
        </div>

        <ul class="navbar-nav">
            <li><a href="/list"
                   class="nav-link">Todos</a></li>
        </ul>

        <ul class="navbar-nav navbar-collapse justify-content-end">
            <li><a href="LogoutServlet"
                   class="nav-link">Logout</a></li>
        </ul>
    </nav>
</header>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${product != null}">
                <form action="update" method="post">
                </c:if>
            <c:if test="${product == null}">
                    <form action="insert" method="post">
                    </c:if>

                        <caption>
                            <h2>
                                <c:if test="${product != null}">
                                Edit Product
                                </c:if>
                                <c:if test="${product == null}">
                                Add New Product
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${product != null}">
                        <input type="hidden" name="id" value="<c:out value='${product.id}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Product name</label>
                            <input type="text" value="<c:out value='${product.name}'/>" class="form-control" name="name" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Product Decription</label>
                            <input type="text" value="<c:out value='${product.description}' />" class="form-control" name="description" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Product Price</label>
                            <input type="text" value="<c:out value='${product.price}' />" class="form-control" name="price" required="required">
                        </fieldset>

                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </form>
        </div>
    </div>
</div>

</body>
</html>
