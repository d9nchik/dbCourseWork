package sample;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Rooms {
    public Rooms() {
    }

    public String getAvailableRooms(UserConnection userConnection, String dateFrom, String dateTo) {
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
                    "SELECT * FROM \"courseWork\".public.rooms JOIN \"courseWork\".public.elite_status es on" +
                            " es.\"EliteStatusID\" = rooms.\"EliteStatusID\" WHERE \"RoomNumber\" IN " +
                            "((SELECT \"RoomNumber\" FROM \"courseWork\".public.rooms) " +
                            "EXCEPT (SELECT \"RoomNumber\" " +
                            "FROM \"courseWork\".public.history_of_rooms WHERE (\"From\" <=  ? AND \"To\" >=  ?)" +
                            " OR (\"From\" <=  ? AND \"To\" >=  ?))) AND \"IsInRepair\"=false");
            preparedStatement.setDate(1, new java.sql.Date(from.getTime()));
            preparedStatement.setDate(2, new java.sql.Date(from.getTime()));
            preparedStatement.setDate(3, new java.sql.Date(to.getTime()));
            preparedStatement.setDate(4, new java.sql.Date(to.getTime()));
            return SQLToHTML.resultSetToTable(preparedStatement.executeQuery());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return "Oops(";
    }
}
