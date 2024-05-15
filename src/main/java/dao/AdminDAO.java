package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.Login;
import utils.DBUtil;

public class AdminDAO {
    public static boolean validate(Login login) {
        boolean status = false;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM admin WHERE mail_address = ?")) {
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

// ユーザー名でユーザー情報を検索するメソッド
    public static List<Account> findUserByColumn(String columnName, String value) {
        List<Account> users = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM account WHERE " + columnName + " LIKE ?")) {
            preparedStatement.setString(1, "%" + value + "%");

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Account user = new Account();
                user.setAccountId(resultSet.getInt("account_id"));
                user.setMailAddress(resultSet.getString("mail_address"));
                user.setPassword(resultSet.getString("password"));
                user.setName(resultSet.getString("name"));
                user.setPostnum(resultSet.getString("postnum"));
                user.setAddress(resultSet.getString("address"));
                user.setBirthday(resultSet.getString("birthday"));
                user.setTelephone(resultSet.getString("telephone"));
               // user.setRecognition(resultSet.getString("recognition"));
               // user.setOkDm(resultSet.getBoolean("ok_dm"));
                //user.setCreatedAt(resultSet.getDate("created_at"));
              //  user.setCreatedAt(resultSet.getDate("updated_at"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

}









/*package dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBUtil;

public class AdminDao {
	private Connection conn;

	public AdminDao() {
		try {
			this.conn = DBUtil.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			// エラー処理
		}
	}
	//ログインのチェック
	public boolean checkLogin(String mail_address, String password) {
		String sql = "SELECT * FROM admin WHERE mail_address = ? AND password = ?";

		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, mail_address);
			statement.setString(2, password);

			try (ResultSet resultSet = statement.executeQuery()) {
				return resultSet.next(); // 結果が存在するかどうかを取得
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public int getUserId(String mail_address, String password) {
		String sql = "SELECT id FROM admin WHERE mail_address = ? AND password = ?";
		int userId = -1; // デフォルトはエラーの場合に返す値

		try (PreparedStatement statement = conn.prepareStatement(sql)) {
			statement.setString(1, mail_address);
			statement.setString(2, password);

			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					userId = resultSet.getInt("id");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// エラー処理
		}

		return userId;
	}
}*/