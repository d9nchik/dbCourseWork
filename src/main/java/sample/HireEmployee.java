package sample;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class HireEmployee {
    public Map<Integer, String> getListOfEmployees(UserConnection connection) {
        Map<Integer, String> integerStringMap = new HashMap<>();
        try {
            ResultSet resultSet = connection.getConnection().createStatement().executeQuery(
                    "SELECT \"EmployeeID\", \"LastName\", \"FirstName\", \"Title\"\n" +
                            "FROM \"courseWork\".public.employees WHERE \"HireDate\" IS NOT NULL;");
            while (resultSet.next()) {
                String label = resultSet.getString(2) + " " + resultSet.getString(3) + " ("
                        + resultSet.getString(4) + ")";
                integerStringMap.put(resultSet.getInt(1), label);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return integerStringMap;
    }

    public boolean registerEmployee(UserConnection userConnection, String lastname, String firstname, String title,
                                    String birthdate, String hireDate, String address, String city, String region,
                                    String postalCode, String mobilePhone, String notes,
                                    String reportsTo, String sex) {
        if (lastname.length() > 20 || firstname.length() > 10 || title.length() > 30 || address.length() > 60
                || region.length() > 15 || postalCode.length() > 10 || mobilePhone.length() > 24) return false;
        try {
            PreparedStatement preparedStatement = userConnection.getConnection().prepareStatement(
                    "INSERT INTO \"courseWork\".public.employees ( \"LastName\", \"FirstName\", \"Title\"," +
                            " \"BirthDate\", \"HireDate\", \"Address\", \"City\",\"Region\", \"PostalCode\"," +
                            "\"Country\", \"MobilePhone\", \"Notes\", \"ReportsTo\", \"IsMale\")\n" +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'Ukraine', ?, ?, ?, ?);");
            Date birthDate = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);
            Date hire = new SimpleDateFormat("yyyy-MM-dd").parse(hireDate);
            int reportsToId = Integer.parseInt(reportsTo);
            preparedStatement.setString(1, lastname);
            preparedStatement.setString(2, firstname);
            preparedStatement.setString(3, title);
            preparedStatement.setDate(4, new java.sql.Date(birthDate.getTime()));
            preparedStatement.setDate(5, new java.sql.Date(hire.getTime()));
            preparedStatement.setString(6, address);
            preparedStatement.setString(7, city);
            preparedStatement.setString(8, region);
            preparedStatement.setString(9, postalCode);
            preparedStatement.setString(10, mobilePhone);
            preparedStatement.setString(11, notes);
            preparedStatement.setInt(12, reportsToId);
            preparedStatement.setBoolean(13, sex.equals("male"));
            preparedStatement.execute();
        } catch (SQLException | ParseException throwables) {
            System.out.println(throwables.getMessage());
            return false;
        }
        return true;
    }
}
