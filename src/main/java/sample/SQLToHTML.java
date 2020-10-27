package sample;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class SQLToHTML {
    public static String resultSetToTable(ResultSet resultSet) throws SQLException {
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
        return accumulator.toString();
    }
}
