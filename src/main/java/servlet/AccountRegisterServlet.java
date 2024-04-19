package servlet;

import java.io.IOException;
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
        // フォームからのデータを取得
        String mailAddress = request.getParameter("mail_address");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String postnum = request.getParameter("postnum");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String telephone = request.getParameter("telephone");
        String recognition = request.getParameter("recognition");
        String okDm = request.getParameter("ok_dm");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // データベースに接続
            conn = DBUtil.getConnection();

            // SQLクエリの準備
            String sql = "INSERT INTO account (mail_address, password, name, postnum, address, birthday, telephone, recognition, ok_dm, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
            pstmt = conn.prepareStatement(sql);

            // パラメータをセット
            pstmt.setString(1, mailAddress);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setString(4, postnum);
            pstmt.setString(5, address);
            pstmt.setString(6, birthday);
            pstmt.setString(7, telephone);
            pstmt.setString(8, recognition);
            pstmt.setString(9, okDm);

            // クエリの実行
            pstmt.executeUpdate();

            // 登録成功のメッセージをセット
            request.setAttribute("message", "アカウントが正常に登録されました。");

        } catch (SQLException ex) {
            // エラー処理
            ex.printStackTrace();
            request.setAttribute("message", "アカウントの登録に失敗しました。");
        } finally {
            // リソースを解放
            DBUtil.closeConnection(conn);
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        // メッセージを表示するページにリダイレクト
        request.getRequestDispatcher("/register-result.jsp").forward(request, response);
    }
}
