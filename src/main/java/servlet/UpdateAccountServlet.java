package servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DBUtil;

@WebServlet("/update-account")
public class UpdateAccountServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accountId = request.getParameter("accountId");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String postnum = request.getParameter("postnum");
		String address = request.getParameter("address");
		String telephone = request.getParameter("telephone");
		String okDm = request.getParameter("ok_dm");

		// チェックボックスがチェックされていない場合は、デフォルトで0を設定
		if (okDm == null) {
			okDm = "0";
		}
		// パスワードをハッシュ化する
		String hashedPassword = hashPassword(password);

		// 新しい情報でデータベースを更新する
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement("UPDATE boasorte.account SET mail_address=?, password=?, postnum=?, address=?, telephone=?, ok_dm=?, updated_at=NOW() WHERE account_id=?");
			stmt.setString(1, email);
			stmt.setString(2, hashedPassword); // ハッシュ化したパスワードをセット
			stmt.setString(3, postnum);
			stmt.setString(4, address);
			stmt.setString(5, telephone);
			stmt.setString(6, okDm);
			stmt.setString(7, accountId);
			int rowsAffected = stmt.executeUpdate();
			if (rowsAffected > 0) {
				System.out.println("アカウント情報が更新されました");
				response.sendRedirect("my-page"); // 更新成功時にはマイページにリダイレクト
			} else {
				System.out.println("アカウント情報の更新に失敗しました");
				// 更新失敗時の処理
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// データベースエラーの処理
		} finally {
			DBUtil.closeResources(conn, stmt, null);
		}
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
			return null;
		}
	}
}
