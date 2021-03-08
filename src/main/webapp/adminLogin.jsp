<%--
  Created by IntelliJ IDEA.
  User: Алишер
  Date: 02/03/2021
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
<form class="register" action="AdminLoginServlet" method="post">
    <input type="text" class="register-input" name="admin" required="required" placeholder="admin">
    <input type="password" class="register-input" name="password" required="required" placeholder="password">

    <input type="submit" value="Login" class="register-button">
</form>
</body>
</html>
