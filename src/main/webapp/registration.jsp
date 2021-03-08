<%--
  Created by IntelliJ IDEA.
  User: Алишер
  Date: 01/03/2021
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
<form class="register" action="RegistrationServlet" method="post">


    <input type="text" class="register-input" name="user" required="required" placeholder="user">
     <input type="password"  class="register-input" name="password" required="required" placeholder="password">

    <input type="submit" value="Create Account" class="register-button" required = "true">
</form>
</body>
</html>
