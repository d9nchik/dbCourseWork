package sample;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CancelReservation {
    public boolean cancelReservation(UserConnection userConnection, String reservationID) {
        int reservationNumber = Integer.parseInt(reservationID);
        try {
            PreparedStatement preparedStatement = userConnection.getConnection().prepareStatement(
                    "DELETE FROM \"courseWork\".public.\"ReservationRecords\" WHERE \"ReservationRecordID\"=?");
            preparedStatement.setInt(1, reservationNumber);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            return false;
        }
        return true;
    }
}
