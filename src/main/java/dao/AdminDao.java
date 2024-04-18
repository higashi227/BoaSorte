package dao;



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
}