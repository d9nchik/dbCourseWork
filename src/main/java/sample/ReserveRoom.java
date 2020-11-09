package sample;

import java.sql.*;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;

public class ReserveRoom {
    public boolean reserveRoom(UserConnection userConnection, String roomNumber, String passportRecordNumber,
                               String fromDate, String toDate) {

        if (passportRecordNumber.length() > 9)
            return false;
        try {
            PreparedStatement chargeForRoom = userConnection.getConnection().prepareStatement(
                    "UPDATE \"courseWork\".public.customers" +
                            " SET \"Balance\"=((SELECT \"Balance\"" +
                            "FROM \"courseWork\".public.customers WHERE \"PassportRecordNumber\" LIKE ?) - ?) " +
                            "WHERE \"PassportRecordNumber\" LIKE ?;");
            final int intRoomNumber = Integer.parseInt(roomNumber);
            chargeForRoom.setString(1, passportRecordNumber);
            chargeForRoom.setInt(2, intRoomNumber);
            chargeForRoom.setString(3, passportRecordNumber);
            chargeForRoom.execute();
            // FIXME: if user can not afford buying he can still buy room
            PreparedStatement preparedStatement = userConnection.getConnection().prepareStatement(
                    "INSERT INTO \"courseWork\".public.reservation_records " +
                            "(\"RoomNumber\", \"CustomerID\", \"StaffID\", \"Price\", \"From\", \"To\")" +
                            "VALUES (?, (SELECT customers.\"CustomerID\" " +
                            "FROM \"courseWork\".public.customers WHERE \"PassportRecordNumber\"=?)," +
                            "        ?, (SELECT \"PricePerNight\" " +
                            "FROM \"courseWork\".public.rooms WHERE rooms.\"RoomNumber\"=?) * ?, ?, ?);");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate from = LocalDate.parse(fromDate, dtf);
            LocalDate to = LocalDate.parse(toDate, dtf);
            long daysBetween = Duration.between(from.atStartOfDay(), to.atStartOfDay()).toDays();
            preparedStatement.setInt(1, intRoomNumber);
            preparedStatement.setString(2, passportRecordNumber);
            preparedStatement.setInt(3, getStuffNumber(userConnection.getConnection()));
            preparedStatement.setInt(4, intRoomNumber);
            preparedStatement.setLong(5, daysBetween);
            preparedStatement.setDate(6, Date.valueOf(from));
            preparedStatement.setDate(7, Date.valueOf(to));
            preparedStatement.execute();
        } catch (SQLException throwables) {
            return false;
        }
        return true;
    }


    private int getStuffNumber(Connection connection) throws SQLException {
        ResultSet resultSet = connection.createStatement().executeQuery("SELECT \"EmployeeID\"\n" +
                "FROM \"courseWork\".public.available_housekeeper");
        ArrayList<Integer> stuffNumbers = new ArrayList<>();
        while (resultSet.next()) {
            stuffNumbers.add(resultSet.getInt(1));
        }
        Random random = new Random();
        int choice = random.nextInt(stuffNumbers.size());
        return stuffNumbers.get(choice);
    }
}
