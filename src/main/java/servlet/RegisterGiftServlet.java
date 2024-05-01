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

@WebServlet("/register-gift")
public class RegisterGiftServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountId = request.getParameter("accountId");

        // 最大5つまでのギフト先を登録する
        for (int i = 1; i <= 5; i++) {
            String gname = request.getParameter("gname" + i);
            String gpostnum = request.getParameter("gpostnum" + i);
            String gaddress = request.getParameter("gaddress" + i);

            // ギフト先情報をデータベースに登録する
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                conn = DBUtil.getConnection();
                stmt = conn.prepareStatement("INSERT INTO boasorte.gift (account_id, gname, gpostnum, gaddress) VALUES (?, ?, ?, ?)");
                stmt.setString(1, accountId);
                stmt.setString(2, gname);
                stmt.setString(3, gpostnum);
                stmt.setString(4, gaddress);
                stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                // データベースエラーの処理
            } finally {
                DBUtil.closeResources(conn, stmt, null);
            }
        }

        // ギフト先登録が完了したらマイページにリダイレクト
        response.sendRedirect("my-page");
    }
}
