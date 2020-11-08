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
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<% if (request.getParameterMap().size() == 2 && adjustBalance.addToBalance(connection, request.getParameter("userID"),
        request.getParameter("amount"))) {%>
<h1>Successfully added <%=request.getParameter("amount")%> to user <%=request.getParameter("userID")%>
</h1>
<%--TODO: add button to main page--%>
<% } else { %>
<form method="post" class="form-group">
    <label>
        UserID:
        <input type="number" min="1" name="userID" required>
    </label>
    <label>
        <input type="number" min="1" name="amount" required value="100">
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
