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
        String accountIdStr = request.getParameter("account_id");

        if (accountIdStr == null || accountIdStr.isEmpty()) {
            // account_id パラメータが存在しない場合または空の場合の処理
            request.setAttribute("error", "Account ID is required.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        try {
            int accountId = Integer.parseInt(accountIdStr);

            boolean isDeleted = AdminDAO.deleteUserById(accountId);

            if (isDeleted) {
                // 削除成功の場合の処理
                request.setAttribute("message", "User deleted successfully.");
                request.getRequestDispatcher("/success.jsp").forward(request, response);
            } else {
                // 削除失敗の場合の処理
                request.setAttribute("error", "Failed to delete user.");
                System.out.println("削除失敗");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                
            }
        } catch (NumberFormatException e) {
            // account_id が整数に変換できない場合の処理
            request.setAttribute("error", "Invalid account ID format.");
            System.out.println("変換失敗");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            
        }
    }
}


//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//
//        try {
//            ItemDAO.deleteItem(id);
//            response.sendRedirect("AdminUserServlet"); // 成功した場合はsuccess.jspにリダイレクトします
//        } catch (SQLException e) {
//            e.printStackTrace();
//            response.sendRedirect("error.jsp"); // 失敗した場合はerror.jspにリダイレクトします
//        }
//    }
//}
