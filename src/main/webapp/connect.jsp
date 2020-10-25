<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 25.10.2020
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="db" class="sample.TestConnection" scope="request"/>
<html>
<head>
    <title>Test</title>
</head>
<body>
<%=db.getString()%>
</body>
</html>
