<%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 06.12.2020
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="cancelReservation" scope="application" class="sample.CancelReservation"/>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Reservation</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<% if (request.getParameterMap().size() == 1 && cancelReservation.cancelReservation(connection,
        request.getParameter("reservationID"))) {%>
<h1>Successfully canceled <%=request.getParameter("reservationID")%>>
</h1>
<%--TODO: add button to main page--%>
<% } else { %>
<form method="post" class="form-group">
    <label>
        reservationID:
        <input type="number" min="1" name="reservationID" required>
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
