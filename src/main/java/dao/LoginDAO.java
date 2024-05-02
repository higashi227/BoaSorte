package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT password FROM account WHERE mail_address = ?")) {
            preparedStatement.setString(1, login.getMailAddress());

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                // メールアドレスが存在する場合
                String storedPassword = resultSet.getString("password");
                String hashedInputPassword = hashPassword(login.getPassword());
                if (storedPassword.equals(hashedInputPassword)) {
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
    public int getAccountId(Login login) {
        int accountId = -1; // デフォルト値はエラーを示すために負の値を設定
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT account_id FROM account WHERE mail_address = ? AND password = ?")) {
            preparedStatement.setString(1, login.getMailAddress());
            preparedStatement.setString(2, hashPassword(login.getPassword()));

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                accountId = resultSet.getInt("account_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accountId;
    }


    // パスワードをハッシュ化するメソッド
    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            // エラーが発生した場合、例外を処理するか、適切な方法でエラーメッセージを処理する
            return null;
        }
    }
}
