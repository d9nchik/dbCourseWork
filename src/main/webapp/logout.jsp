<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 27.10.2020
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="connection" class="sample.UserConnection" scope="session"/>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<% connection.close();%>
<jsp:forward page="login.jsp"/>
</body>
</html>
