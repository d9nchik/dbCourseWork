package sample;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Employees {
    public Employees() {
    }

    public String getEmployees(UserConnection userConnection) {
        try {
            ResultSet resultSet = userConnection.getConnection().createStatement().executeQuery(
                    "SELECT * FROM \"courseWork\".public.employees");
            return SQLToHTML.resultSetToTable(resultSet);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return "Oops(";
    }
}
