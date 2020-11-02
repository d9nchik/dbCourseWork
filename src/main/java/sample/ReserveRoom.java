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
            PreparedStatement preparedStatement = userConnection.getConnection().prepareStatement(
                    "INSERT INTO \"courseWork\".public.history_of_rooms (\"RoomNumber\", \"CustomerID\", \"StaffID\", \"Price\",\n" +
                            "                                                  \"From\", \"To\")\n" +
                            "VALUES (?, (SELECT customers.\"CustomerID\" " +
                            "FROM \"courseWork\".public.customers WHERE \"PassportRecordNumber\"=?),\n" +
                            "        ?, (SELECT \"PricePerNight\" " +
                            "FROM \"courseWork\".public.rooms WHERE rooms.\"RoomNumber\"=?) * ?, ?, ?);\n");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate from = LocalDate.parse(fromDate, dtf);
            LocalDate to = LocalDate.parse(toDate, dtf);
            long daysBetween = Duration.between(from, to).toDays();
            final int intRoomNumber = Integer.parseInt(roomNumber);
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
                "FROM \"courseWork\".public.employees\n" +
                "WHERE \"Title\" LIKE '%_окоївка' AND \"FireDate\" IS NULL;");
        ArrayList<Integer> stuffNumbers = new ArrayList<>();
        while (resultSet.next()) {
            stuffNumbers.add(resultSet.getInt(1));
        }
        Random random = new Random();
        int choice = random.nextInt(stuffNumbers.size());
        return stuffNumbers.get(choice);
    }
}
