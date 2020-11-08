<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 27.10.2020
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<html>
<head>
    <title>Login</title>
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
<form method="post" action="login.jsp">
    <label>Login
        <input type="text" name="login">
    </label>
    <label>Password
        <input type="password" name="password">
    </label>
    <input type="submit" value="Login">
</form>
</body>
</html>
