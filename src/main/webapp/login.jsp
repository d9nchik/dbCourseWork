<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 27.10.2020
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<% if (connection.isConnected()) {%>
<jsp:forward page="index.jsp"/>
<%}%>
<% if (request.getParameterMap().size() == 2) {
    connection.connect(request.getParameter("login"), request.getParameter("password"));
    if (connection.isConnected()) {
%>
<jsp:forward page="index.jsp"/>
<%} else {%>
<h2>Connection unsuccessful. Try again</h2>
<%
        }
    }
%>
<form method="post" action="login.jsp" class="form-group">
    <label>Login
        <input type="text" name="login" required>
    </label>
    <label>Password
        <input type="password" name="password" required>
    </label>
    <button type="submit" class="btn btn-primary">Login</button>
</form>
<script crossorigin="anonymous"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
