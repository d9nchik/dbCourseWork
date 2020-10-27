<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 27.10.2020
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="employees" scope="application" class="sample.Employees"/>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>

<html>
<head>
    <title>Employees</title>
</head>
<body>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<%=employees.getEmployees(connection)%>
</body>
</html>
