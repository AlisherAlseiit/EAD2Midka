

<%@include file="header.jsp"%>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Products</h3>

        <jsp:useBean id="obj" class="com.midka.model.User"/>
        <%
            String n = obj.name((String) request.getAttribute("adminName"));

            if (request.getAttribute("adminName") == null) {
                n = "";
            }
        %>

        <p style="color:green"><% out.println(n);%></p>

        <hr>

        <div class="container text-left">

            <a href="/new"
               class="btn btn-success">ADD Product</a>


            <a href="checkOrders.jsp"
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