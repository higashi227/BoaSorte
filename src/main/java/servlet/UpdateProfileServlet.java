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

@WebServlet("/update-profile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String field = request.getParameter("field");
        String value = request.getParameter("value");
        int accountId = Integer.parseInt(request.getParameter("account_id"));

        // データベースを更新する処理
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DBUtil.getConnection();
            String query = "UPDATE boasorte.account SET " + field + " = ? WHERE account_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, value);
            stmt.setInt(2, accountId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // エラー処理を行う
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 内部サーバーエラーを返す
            return;
        } finally {
            DBUtil.closeResources(conn, stmt, null);
        }

        // 更新が成功した場合はステータスコード200を返す
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
