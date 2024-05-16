package servlet;

import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountIdStr = request.getParameter("id"); // "id"パラメータを取得する

        if (accountIdStr == null || accountIdStr.isEmpty()) {
            // アカウントIDが提供されていない場合の処理
            System.err.println("Error: Account ID is required.");
            response.sendRedirect("error.jsp");
            return;
        }

        try {
            int accountId = Integer.parseInt(accountIdStr); // 文字列からアカウントIDを解析する

            boolean isDeleted = AdminDAO.deleteUserById(accountId); // ユーザーを削除するメソッドを呼び出す

            if (isDeleted) {
                // 削除成功時の処理
                System.out.println("User deleted successfully.");
                response.sendRedirect("AdminUserServlet");
            } else {
                // 削除失敗時の処理
                System.err.println("Failed to delete user.");
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // アカウントIDが数値に変換できない場合の処理
            System.err.println("Error: Invalid account ID format.");
            e.printStackTrace(); // エラーをコンソールに出力
            response.sendRedirect("error.jsp");
        }
    }
}
