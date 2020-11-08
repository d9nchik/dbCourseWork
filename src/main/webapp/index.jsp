<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 19.10.2020
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<!DOCTYPE html>
<html>
<head>
    <title>Sanatorium site</title>
    <!--    TODO: change in production version to CDN-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<h1>Welcome to admin panel of site!</h1>
<h2>Admitted actions</h2>
<ul class="list-group">
    <li class="list-group-item list-group-item-action"><a href="hireEmployee.jsp">Hire new employee</a></li>
    <li class="list-group-item list-group-item-action"><a href="registerCustomer.jsp">Add new customer to the system</a>
    </li>
    <li class="list-group-item list-group-item-action"><a href="rooms.jsp">Watch available rooms</a></li>
    <li class="list-group-item list-group-item-action"><a href="logout.jsp">Logout</a></li>
</ul>

<script crossorigin="anonymous"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!--TODO: in production should be CDN-->
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
