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

@WebServlet("/register")
public class AccountRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";

        // フォームからのデータを取得
        String mailAddress = request.getParameter("mail_address");
        String rawPassword = request.getParameter("password"); // 生のパスワードを取得
        String name = request.getParameter("name");
        String postnum = request.getParameter("postnum");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String telephone = request.getParameter("telephone");
        String recognition = request.getParameter("recognition");
        String okDm = request.getParameter("ok_dm");

        // パスワードをハッシュ化
        String hashedPassword = hashPassword(rawPassword);

        // データベース操作
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = createStatement(conn, mailAddress, hashedPassword, name, postnum, address, birthday, telephone, recognition, okDm)) {

            // クエリの実行
            pstmt.executeUpdate();
            message = "アカウントが正常に登録されました。";

        } catch (SQLException ex) {
            ex.printStackTrace();
            message = "アカウントの登録に失敗しました。";
        }

        // メッセージをセットしてリダイレクト
        request.setAttribute("message", message);
        request.getRequestDispatcher("/register-result.jsp").forward(request, response);
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

    // PreparedStatementを作成するメソッド
    private PreparedStatement createStatement(Connection conn, String mailAddress, String hashedPassword, String name, String postnum, String address, String birthday, String telephone, String recognition, String okDm) throws SQLException {
        String sql = "INSERT INTO account (mail_address, password, name, postnum, address, birthday, telephone, recognition, ok_dm, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, mailAddress);
        pstmt.setString(2, hashedPassword);
        pstmt.setString(3, name);
        pstmt.setString(4, postnum);
        pstmt.setString(5, address);
        pstmt.setString(6, birthday);
        pstmt.setString(7, telephone);
        pstmt.setString(8, recognition);
        pstmt.setString(9, okDm);
        return pstmt;
    }
}
