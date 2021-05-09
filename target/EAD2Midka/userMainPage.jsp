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

    <link rel="apple-touch-icon" type="image/png"
          href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png"/>


    <link rel="shortcut icon" type="image/x-icon"
          href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico"/>

    <link rel="mask-icon" type=""
          href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
          color="#111"/>


    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">

    <style>

        .navbar {
            overflow: hidden;
            background-color: #333;
            margin-bottom: 25px;
            margin-top: -55px;

        }

        .navbar a {
            float: left;
            font-size: 16px;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: white;
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }

        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: red;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        <%--        --%>


        html, body {
            background: #E3E3D8;
            font-family: sans-serif;
            padding: 25px;
        }

        .wrapper {
            width: 300px;
            height: 500px;
            background: white;
            margin: auto;
            position: relative;
            overflow: hidden;
            border-radius: 10px 10px 10px 10px;
            box-shadow: 0;
            transform: scale(0.95);
            transition: box-shadow 0.5s, transform 0.5s;
        }

        .wrapper:hover {
            transform: scale(1);
            box-shadow: 5px 20px 30px rgba(0, 0, 0, 0.2);
        }

        .wrapper .container {
            width: 100%;
            height: 100%;
        }

        .wrapper .container .top {

            /*background: url(https://s-media-cache-ak0.pinimg.com/736x/49/80/6f/49806f3f1c7483093855ebca1b8ae2c4.jpg) no-repeat center center;*/
            -webkit-background-size: 100%;
            -moz-background-size: 100%;
            -o-background-size: 100%;
            background-size: 100%;
        }

        .wrapper .container .bottom {
            width: 200%;
            height: 50%;
            transition: transform 0.5s;
        }

        .wrapper .container .bottom.clicked {
            transform: translateX(-50%);
        }

        .wrapper .container .bottom h1 {
            margin: 0;
            padding: 0;
        }

        .wrapper .container .bottom p {
            margin: 0;
            padding: 0;
        }

        .wrapper .container .bottom .left {
            height: 139%;
            width: 50%;
            background: #f4f4f4;
            position: relative;
            float: left;
        }

        .wrapper .container .bottom .left .details {
            padding: 20px;
            float: left;
            width: calc(70% - 40px);
        }

        .wrapper .container .bottom .left .buy {
            float: right;
            width: calc(30% - 2px);
            height: 100%;
            background: #f1f1f1;
            transition: background 0.5s;
            border-left: solid thin rgba(0, 0, 0, 0.1);
        }

        .wrapper .container .bottom .left .buy i {
            font-size: 30px;
            padding: 30px;
            color: #254053;
            transition: transform 0.5s;
        }

        .wrapper .container .bottom .left .buy:hover {
            background: #A6CDDE;
        }

        .wrapper .container .bottom .left .buy:hover i {
            transform: translateY(5px);
            color: #00394B;
        }

        .wrapper .container .bottom .right {
            width: 50%;
            background: #A6CDDE;
            color: white;
            float: right;
            height: 200%;
            overflow: hidden;
        }

        .wrapper .container .bottom .right .details {
            padding: 20px;
            float: right;
            width: calc(70% - 40px);
        }

        .wrapper .container .bottom .right .done {
            width: calc(30% - 2px);
            float: left;
            transition: transform 0.5s;
            border-right: solid thin rgba(255, 255, 255, 0.3);
            height: 50%;
        }

        .wrapper .container .bottom .right .done i {
            font-size: 30px;
            padding: 30px;
            color: white;
        }

        .wrapper .container .bottom .right .remove {
            width: calc(30% - 1px);
            clear: both;
            border-right: solid thin rgba(255, 255, 255, 0.3);
            height: 50%;
            background: #BC3B59;
            transition: transform 0.5s, background 0.5s;
        }

        .wrapper .container .bottom .right .remove:hover {
            background: #9B2847;
        }

        .wrapper .container .bottom .right .remove:hover i {
            transform: translateY(5px);
        }

        .wrapper .container .bottom .right .remove i {
            transition: transform 0.5s;
            font-size: 30px;
            padding: 30px;
            color: white;
        }

        .wrapper .container .bottom .right:hover .remove, .wrapper .container .bottom .right:hover .done {
            transform: translateY(-100%);
        }

        .wrapper .inside {
            z-index: 9;
            background: #92879B;
            width: 140px;
            height: 140px;
            position: absolute;
            top: -70px;
            right: -70px;
            border-radius: 0px 0px 200px 200px;
            transition: all 0.5s, border-radius 2s, top 1s;
            overflow: hidden;
        }

        .wrapper .inside .icon {
            position: absolute;
            right: 85px;
            top: 85px;
            color: white;
            opacity: 1;
        }

        .wrapper .inside:hover {
            width: 100%;
            right: 0;
            top: 0;
            border-radius: 0;
            height: 80%;
        }

        .wrapper .inside:hover .icon {
            opacity: 0;
            right: 15px;
            top: 15px;
        }

        .wrapper .inside:hover .contents {
            opacity: 1;
            transform: scale(1);
            transform: translateY(0);
        }

        .wrapper .inside .contents {
            padding: 5%;
            opacity: 0;
            transform: scale(0.5);
            transform: translateY(-200%);
            transition: opacity 0.2s, transform 0.8s;
        }

        .wrapper .inside .contents table {
            text-align: left;
            width: 100%;
        }

        .wrapper .inside .contents h1, .wrapper .inside .contents p, .wrapper .inside .contents table {
            color: white;
        }

        .wrapper .inside .contents p {
            font-size: 13px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
        }

        .row > div[class*='col-'] {
            display: flex;
        }
        /* CSS ICON ALERT GENERAL */
        .screenAlert-icon{border-radius:50%;border:4px solid gray;box-sizing:content-box;height:80px;
            padding:0;position:relative;width:80px;
            margin: 600px 5px 500px auto;
        }
        .screenAlert-icon + .screenAlert-icon {margin-top:50px}



        /* CSS SUCCESS */
        .screenAlert-icon.screenAlert-success{border-color:#A5DC86}
        .screenAlert-icon.screenAlert-success:after,
        .screenAlert-icon.screenAlert-success:before{background-color:transparent!important;content:'';height:120px;position:absolute;-webkit-transform:rotate(45deg);transform:rotate(45deg);width:60px}
        .screenAlert-icon.screenAlert-success:before{border-radius:120px 0 0 120px;left:-33px;top:-7px;-webkit-transform-origin:60px 60px;transform-origin:60px 60px;-webkit-transform:rotate(-45deg);transform:rotate(-45deg)}
        .screenAlert-icon.screenAlert-success:after{border-radius:0 120px 120px 0;left:30px;top:-11px;-webkit-transform-origin:0 60px;transform-origin:0 60px;-webkit-transform:rotate(-45deg);transform:rotate(-45deg)}
        .screenAlert-icon.screenAlert-success .screenAlert-placeholder{border-radius:50%;border:4px solid rgba(165,220,134,0.2);box-sizing:content-box;height:80px;left:-4px;position:absolute;top:-4px;width:80px;z-index:2}
        .screenAlert-icon.screenAlert-success .screenAlert-line{background-color:#A5DC86;border-radius:2px;display:block;height:5px;position:absolute;z-index:2}
        .screenAlert-icon.screenAlert-success .screenAlert-line.screenAlert-tip{left:14px;top:46px;-webkit-transform:rotate(45deg);transform:rotate(45deg);width:25px}
        .screenAlert-icon.screenAlert-success .screenAlert-line.screenAlert-long{right:8px;top:38px;-webkit-transform:rotate(-45deg);transform:rotate(-45deg);width:47px}
        .animateSuccessTip{-webkit-animation:animateSuccessTip .75s;animation:animateSuccessTip .75s}
        .animateSuccessLong{-webkit-animation:animateSuccessLong .75s;animation:animateSuccessLong .75s}
        /* ANIMATE SUCCESS */
        @-webkit-keyframes animateSuccessTip{0%,54%{width:0;left:1px;top:19px}70%{width:50px;left:-8px;top:37px}84%{width:17px;left:21px;top:48px}100%{width:25px;left:14px;top:45px}}
        @keyframes animateSuccessTip{0%,54%{width:0;left:1px;top:19px}70%{width:50px;left:-8px;top:37px}84%{width:17px;left:21px;top:48px}100%{width:25px;left:14px;top:45px}}
        @-webkit-keyframes animateSuccessLong{0%,65%{width:0;right:46px;top:54px}84%{width:55px;right:0;top:35px}100%{width:47px;right:8px;top:38px}}
        @keyframes animateSuccessLong{0%,65%{width:0;right:46px;top:54px}84%{width:55px;right:0;top:35px}100%{width:47px;right:8px;top:38px}}

    </style>

    <script>
        window.console = window.console || function (t) {
        };
    </script>


    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
    </script>

</head>


<body translate="no">

<div class="navbar">
    <a href="" class="navbar-brand"> Product App</a>
    <div class="dropdown">
        <button class="dropbtn">Dropdown
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="/userList"
               class="nav-link">Products</a>
            <a href="LogoutServlet"
               class="nav-link">Logout</a>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <c:forEach var="product" items="${products}">
            <div class="col-sm-3">
                <div class="wrapper">
                    <div class="container">
                        <div class=""><img class="top" src="<c:out value="${product.img}"/>"
                                           alt="" width="290" height="290"></div>
                        <div class="bottom">
                            <div class="left">
                                <div class="details">
                                    <h1><c:out value="${product.name}"/></h1>
                                    <p><c:out value="${product.price}$"/></p>
                                </div>
                                <div class="buy"><a href="/buy?id=<c:out value='${product.id}' />"><i
                                        class="material-icons">add_shopping_cart</i></a></div>
                            </div>
                            <div class="right">
                                <div class="done"><i class="material-icons">done</i></div>
                                <div class="details">
                                    <h1>Chair</h1>
                                    <p>Added to your cart</p>
                                </div>
                                <div class="remove"><i class="material-icons">clear</i></div>
                            </div>
                        </div>
                    </div>
                    <div class="inside">
                        <div class="icon"><i class="material-icons">info_outline</i></div>
                        <div class="contents">
                            <table>
                                <tr>
                                    <th>description</th>
                                </tr>
                                <tr>
                                    <td><c:out value="${product.description}"/></td>

                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%
    if (request.getAttribute("cool") == "cool") {
%>
<div class="screenAlert-icon screenAlert-success animate">
    <span class="screenAlert-line screenAlert-tip animateSuccessTip"></span>
    <span class="screenAlert-line screenAlert-long animateSuccessLong"></span>
    <div class="screenAlert-placeholder"></div>
    <div class="screenAlert-fix"></div>
</div>
<%
    }
%>


<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script id="rendered-js">
    $('.buy').click(function () {
        $('.bottom').addClass("clicked");
    });

    $('.remove').click(function () {
        $('.bottom').removeClass("clicked");
    });
    //# sourceURL=pen.js
</script>


</body>
</html>