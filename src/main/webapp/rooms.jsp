<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %><%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 27.10.2020
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="rooms" scope="application" class="sample.Rooms"/>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<!DOCTYPE html>
<html>
<head>
    <title>Employees</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<h1>Available rooms</h1>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<%if (request.getParameterMap().size() == 2) {%>
<%=rooms.getAvailableRooms(connection, request.getParameter("from"), request.getParameter("to"))%>
<%} else {%>
<%--TODO: add more parameters for searching of room--%>
<form method="POST" class="form-group">
    <label>From:
        <input type="date" name="from" required>
    </label><br>
    <label>To
        <input type="date" name="to" required>
    </label>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<%}%>
<script crossorigin="anonymous"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>