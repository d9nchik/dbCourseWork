<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: d9nich
  Date: 01.11.2020
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="registerEmployee" scope="application" class="sample.HireEmployee"/>
<jsp:useBean id="connection" scope="session" class="sample.UserConnection"/>
<!DOCTYPE html>
<html>
<head>
    <title>Hire employee</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
</head>
<body>
<%if (!connection.isConnected()) {%>
<jsp:forward page="login.jsp"/>
<%}%>
<% if (request.getParameterMap().size() == 13 && registerEmployee.registerEmployee(connection,
        request.getParameter("lastname"), request.getParameter("firstname"), request.getParameter("title"),
        request.getParameter("birthdate"), request.getParameter("hireDate"), request.getParameter("address"),
        request.getParameter("city"), request.getParameter("region"), request.getParameter("postalCode"),
        request.getParameter("mobilePhone"), request.getParameter("notes"), request.getParameter("reportTo"),
        request.getParameter("sex"))) {%>
<h1>Successfully registered new employee</h1>
<% } else { %>
<form method="post">
    <label>
        Lastname:
        <input type="text" maxlength="20" name="lastname" required>
    </label><br>
    <label>
        Firstname:
        <input type="text" maxlength="10" name="firstname" required>
    </label><br>
    <label>
        Sex:
        <select name="sex">
            <option value="male">male</option>
            <option value="female">female</option>
        </select>
    </label>

    <label>
        Title:
        <input type="text" maxlength="30" name="title">
    </label><br>
    <label>
        Birthdate:
        <input type="date" name="birthdate">
    </label><br>
    <label>
        Hire date:
        <input type="date" name="hireDate">
    </label><br>

    <label>
        Address:
        <input type="text" maxlength="60" name="address">
    </label><br>

    <label>
        City:
        <input type="text" maxlength="15" name="city">
    </label><br>

    <label>
        Region:
        <input type="text" maxlength="15" name="region">
    </label><br>

    <label>
        Postal code:
        <input type="text" maxlength="10" name="postalCode">
    </label><br>


    <label>
        Mobile Phone:
        <input type="text" maxlength="24" name="mobilePhone">
    </label><br>

    <label>
        Notes:
        <textarea name="notes"></textarea>
    </label>

    <label>
        Reports to:
        <select name="reportTo">
            <%
                Map<Integer, String> integerStringMap = registerEmployee.getListOfEmployees(connection);

                for (Integer key : integerStringMap.keySet()) {
            %>
            <option value="<%=key%>"><%=integerStringMap.get(key)%>
            </option>
            <%}%>
        </select>
    </label>

    <input type="submit" value="Submit">
</form>
<%}%>
</body>
</html>
