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

<html>
<head>
    <title>Employees</title>
</head>
<body>
<h1>Available rooms</h1>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<%if (request.getParameterMap().size() == 2) {%>
<%=rooms.getAvailableRooms(connection, request.getParameter("from"), request.getParameter("to"))%>
<%} else {%>
<form method="POST">
    <label>From:
        <input type="date" name="from">
    </label><br>
    <label>To
        <input type="date" name="to">
    </label>
    <input type="submit">
</form>
<%}%>
</body>
</html>