<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 07.11.2020
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="adjustBalance" scope="application" class="sample.AdjustBalance"/>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>

<html>
<head>
    <title>Add money to customer valet</title>
</head>
<body>
<% if (request.getParameterMap().size() == 2 && adjustBalance.addToBalance(connection, request.getParameter("userID"),
        request.getParameter("amount"))) {%>
<h1>Successfully added <%=request.getParameter("amount")%> to user <%=request.getParameter("userID")%>
</h1>
<% } else { %>
<form>
    <label>
        UserID:
        <input type="number" min="1" name="userID" required>
    </label>
    <label>
        <input type="number" min="1" name="amount" required value="100">
    </label>
    <input type="submit">
</form>
<%}%>
</body>
</html>
