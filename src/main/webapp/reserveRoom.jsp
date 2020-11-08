<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 02.11.2020
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="reserveRoom" scope="application" class="sample.ReserveRoom"/>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<html>
<head>
    <title>Reserve room</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
</head>
<body>
<% if (request.getParameterMap().size() == 4 && reserveRoom.reserveRoom(connection, request.getParameter("roomNumber"),
        request.getParameter("passportNumber"), request.getParameter("fromDate"), request.getParameter("toDate"))) {%>
<h1>Successfully reserved a room <%=request.getParameter("roomNumber")%>
</h1>
<% } else { %>
<%-- TODO: room numer and date should come from rooms link--%>
<form method="post">
    <label>
        Room number:
        <input type="number" min="1" name="roomNumber">
    </label><br>
    <label>
        Passport record number
        <input type="text" max="9" min="8" name="passportNumber">
    </label><br>

    <label>
        From date(inclusive)
        <input type="date" name="fromDate">
    </label><br>
    <label>
        To date(exclusive)
        <input type="date" name="toDate">
    </label><br>
    <input type="submit">
</form>
<%}%>
</body>
</html>
