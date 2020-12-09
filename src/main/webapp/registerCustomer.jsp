<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 01.11.2020
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="registerCustomers" scope="application" class="sample.RegisterCustomer"/>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<html>
<head>
    <title>Register Customer</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<% if (request.getParameterMap().size() == 4 && registerCustomers.registerUser(connection,
        request.getParameter("lastname"), request.getParameter("firstname"),
        request.getParameter("birthdate"), request.getParameter("passportNumber"))) {%>
<h1>Successfully registered</h1>
<% } else { %>
<form method="post">
    <label>
        Lastname
        <input type="text" maxlength="20" name="lastname">
    </label><br>
    <label>
        Firstname
        <input type="text" maxlength="10" name="firstname">
    </label><br>
    <label>
        Birthdate
        <input type="date" name="birthdate">
    </label><br>
    <label>
        Passport Number
        <input type="text" maxlength="9" name="passportNumber">
    </label>
    <input type="submit" value="Submit">
</form>
<% } %>
<script crossorigin="anonymous"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
