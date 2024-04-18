package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Login;
import utils.DBUtil;

public class LoginDAO {

    public boolean validate(Login login) {
        boolean status = false;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM account WHERE mail_address = ?")) {
            preparedStatement.setString(1, login.getMailAddress());

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                // メールアドレスが存在する場合
                String storedPassword = resultSet.getString("password");
                if (storedPassword.equals(login.getPassword())) {
                    // パスワードが一致する場合
                    status = true;
                } else {
                    // パスワードが一致しない場合
                    System.out.println("パスワードが正しくありません");
                }
            } else {
                // メールアドレスが存在しない場合
                System.out.println("指定されたメールアドレスのアカウントは存在しません");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
