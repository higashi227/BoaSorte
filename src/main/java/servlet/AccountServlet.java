package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.DBUtil;

@WebServlet("/my-page")
public class AccountServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // 未ログインの場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }

        String loggedInUser = (String) session.getAttribute("user"); // ログインユーザーのメールアドレスを取得

        List<Map<String, String>> accounts = new ArrayList<>();

        // データベースからログインしたユーザーに関連するデータのみを取得
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            System.out.println("データベース接続成功");
            stmt = conn.prepareStatement("SELECT * FROM boasorte.account WHERE mail_address = ?");
            stmt.setString(1, loggedInUser);
            rs = stmt.executeQuery();

            // 結果をリストに格納
            while (rs.next()) {
                Map<String, String> account = new HashMap<>();
                account.put("account_id", rs.getString("account_id"));
                account.put("mail_address", rs.getString("mail_address"));
                account.put("name", rs.getString("name"));
                account.put("postnum", rs.getString("postnum"));
                account.put("address", rs.getString("address"));
                account.put("birthday", rs.getString("birthday"));
                account.put("telephone", rs.getString("telephone"));
                account.put("recognition", rs.getString("recognition"));
                account.put("ok_dm", rs.getString("ok_dm"));
                account.put("created_at", rs.getString("created_at"));
                account.put("updated_at", rs.getString("updated_at"));
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResources(conn, stmt, rs);
        }

        // JSPにアカウント情報を渡す
        request.setAttribute("accounts", accounts);
        System.out.println("アカウント情報をリクエストスコープにセットしました: " + accounts); // リクエストスコープにセットされたアカウント情報を確認するためのログ

        // マイページにフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/my-page.jsp");
        dispatcher.forward(request, response);
    }
}