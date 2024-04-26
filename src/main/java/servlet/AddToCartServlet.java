package servlet;
import java.io.IOException;
import java.sql.SQLException;

import dao.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("item_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity_" + itemId));
        int accountId = 3; // 仮のアカウントID（セッションまたはログイン機能から取得するべきです）

        CartDAO cartDAO = new CartDAO();
        try {
            if (cartDAO.addToCart(accountId, itemId, quantity)) {
                response.sendRedirect("cart.jsp"); // カートページへリダイレクト
            } else {
                response.sendRedirect("error.jsp"); // エラーページへリダイレクト
            }
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage());
        }
    }
}