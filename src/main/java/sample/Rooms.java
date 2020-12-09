package sample;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Rooms {
    public Rooms() {
    }

    public String getAvailableRooms(UserConnection userConnection, String dateFrom, String dateTo, String pageNumber) {
        Date from;
        Date to;
        try {
            from = new SimpleDateFormat("yyyy-MM-dd").parse(dateFrom);
            to = new SimpleDateFormat("yyyy-MM-dd").parse(dateTo);

        } catch (ParseException e) {
            e.printStackTrace();
            return "(((";
        }
        try {
            PreparedStatement preparedStatement = userConnection.getConnection().prepareStatement(
                    "SELECT \"RoomNumber\",\n" +
                            "       \"EliteStatusDescription\",\n" +
                            "       \"PricePerNight\",\n" +
                            "       \"NumberOfPeople\",\n" +
                            "       \"Notes\" FROM \"courseWork\".public.\"getAvailableNumbersForPeriod\"(?, ?) " +
                            "ORDER BY  \"RoomNumber\" LIMIT 10 OFFSET ?;");
            preparedStatement.setDate(1, new java.sql.Date(from.getTime()));
            preparedStatement.setDate(2, new java.sql.Date(to.getTime()));
            preparedStatement.setInt(3, (Integer.parseInt(pageNumber) - 1) * 10);
            return SQLToHTML.resultSetToTable(preparedStatement.executeQuery());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return "Oops(";
    }
}
