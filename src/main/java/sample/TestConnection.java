package sample;

import java.sql.*;

public class TestConnection {
    private String string;

    public TestConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost/courseWork",
                    "d9nich", "J'~3)Yq=JpFAzQMT");
            ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM \"courseWork\".public.employees");
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int columnCount = resultSetMetaData.getColumnCount();
            StringBuilder accumulator = new StringBuilder();
            accumulator.append("<table><thead><tr>");
            for (int i = 0; i < columnCount; i++) {
                accumulator.append("<th>").append(resultSetMetaData.getColumnName(i + 1)).append("</th>");
            }
            accumulator.append("</tr></thead>");
            while (resultSet.next()) {
                accumulator.append("<tr>");
                for (int i = 0; i < columnCount; i++)
                    accumulator.append("<td>").append(resultSet.getString(i + 1)).append("</td>");
                accumulator.append("<tr>");
            }
            accumulator.append("<table>");
            string = accumulator.toString();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public String getString() {
        return string;
    }
}
