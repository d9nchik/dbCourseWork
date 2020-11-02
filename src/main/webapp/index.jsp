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
</head>
<body>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<h1>Welcome to admin panel of site!</h1>
<h2>Admitted actions</h2>
<ul>
    <li><a href="hireEmployee.jsp">Hire new employee</a></li>
    <li><a href="registerCustomer.jsp">Add new customer to the system</a></li>
    <li><a href="rooms.jsp">Watch available rooms</a></li>
    <li><a href="logout.jsp">Logout</a></li>
</ul>

</body>
</html>
