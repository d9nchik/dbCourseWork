package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestConnection {
    private String string;

    public TestConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost/courseWork",
                    "d9nich", "J'~3)Yq=JpFAzQMT");
            ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM \"courseWork\".public.\"Employees\"");

            string = SQLToHTML.resultSetToTable(resultSet);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public String getString() {
        return string;
    }
}
