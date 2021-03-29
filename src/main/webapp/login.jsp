<%--
  Created by IntelliJ IDEA.
  User: Алишер
  Date: 01/03/2021
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
<form class="register" action="LoginServlet" method="post">
    <input type="text" class="register-input" name="user" required="required" placeholder="user">
    <input type="password" class="register-input" name="password" required="required" placeholder="password">

    <input type="submit" value="Login" class="register-button">
</form>


<%
    if (request.getAttribute("message") != null) {
%>
<%! String message = "You successfully registered!!"; %>
<%-- This line will be show if the user successfully registered and redirected to sith page--%>
<p style="color:green">Operation: <%=message%>
</p>
<%
    }
%>

</body>
</html>
