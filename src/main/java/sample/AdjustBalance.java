package sample;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class AdjustBalance {

    public boolean addToBalance(UserConnection userConnection, String userNumberInString, String amountInString) {
        int userNumber = Integer.parseInt(userNumberInString);
        int amount = Integer.parseInt(amountInString);
        if (userNumber <= 0 || amount <= 0)
            return false;
        try {
            PreparedStatement preparedStatement = userConnection.getConnection().prepareStatement(
                    "UPDATE \"courseWork\".public.customers " +
                            "SET \"Balance\"=(SELECT \"Balance\" " +
                            "FROM \"courseWork\".public.customers WHERE \"CustomerID\" = ?) + ?" +
                            "WHERE \"CustomerID\" = ?");
            preparedStatement.setInt(1, userNumber);
            preparedStatement.setInt(2, amount);
            preparedStatement.setInt(3, userNumber);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            return false;
        }
        return true;
    }
}