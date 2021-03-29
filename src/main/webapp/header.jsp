<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page isELIgnored="false" %>
<%@ page errorPage="myErrorPage.jsp" %>
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
            <li><a href="/list"
                   class="nav-link">Products</a></li>
        </ul>


        <ul class="navbar-nav navbar-collapse justify-content-end">
            <li><a href="AdminLogoutServlet"
                   class="nav-link">Logout</a></li>
        </ul>
    </nav>
</header>