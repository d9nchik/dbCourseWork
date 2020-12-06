package sample;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RegisterCustomer {
    public boolean registerUser(UserConnection userConnection, String lastname, String firstname,
                                String birthdate, String passportRecordNumber) {
        if (lastname.length() > 20 || firstname.length() > 10 || passportRecordNumber.length() > 9)
            return false;
        try {
            PreparedStatement preparedStatement = userConnection.getConnection().prepareStatement(
                    "INSERT INTO \"courseWork\".public.\"Customers\" (\"LastName\", \"FirstName\", \"BirthDate\"," +
                            " \"PassportRecordNumber\") VALUES (?, ?, ?, ?);");

            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);
            preparedStatement.setString(1, lastname);
            preparedStatement.setString(2, firstname);
            preparedStatement.setDate(3, new java.sql.Date(date.getTime()));
            preparedStatement.setString(4, passportRecordNumber);
            preparedStatement.execute();
        } catch (SQLException | ParseException throwables) {
            return false;
        }
        return true;
    }
}
