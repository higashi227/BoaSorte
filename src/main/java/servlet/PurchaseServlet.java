package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.CartDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private boolean isUserLoggedIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountId") == null) {
            response.sendRedirect("login.jsp");
            System.out.println("ログインしてください");
            return false;
        }
        return true;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isUserLoggedIn(request, response)) {
            return;
        }

        int accountId = (Integer) request.getSession().getAttribute("accountId");
        int shippingFee = Integer.parseInt(request.getParameter("shippingFee"));

        CartDAO cartDAO = new CartDAO();
        try {
            List<CartItem> cartItems = cartDAO.getGroupedCartItemsByAccountId(accountId);

            // 合計金額を計算
            int totalPrice = 0;
            for (CartItem cartItem : cartItems) {
                totalPrice += cartItem.getPrice() * cartItem.getQuantity();
            }

            // 送料を合計金額に追加
            totalPrice += shippingFee;

            // 購入画面で情報を表示
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("shippingFee", shippingFee);
            RequestDispatcher dispatcher = request.getRequestDispatcher("purchase.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp?status=failed");
        }
    }
}