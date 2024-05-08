package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.CartDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import utils.DBUtil;

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
        CartDAO cartDAO = new CartDAO();
        int freeShippingThreshold = 3000;
        int shippingFee = 650;

        // アカウント情報の取得
        Map<String, String> account = new HashMap<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement("SELECT postnum, address FROM boasorte.account WHERE account_id = ?");
            stmt.setInt(1, accountId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                account.put("postnum", rs.getString("postnum"));
                account.put("address", rs.getString("address"));
            }

            List<CartItem> cartItems = cartDAO.getGroupedCartItemsByAccountId(accountId);
            int totalPrice = cartItems.stream().mapToInt(item -> item.getPrice() * item.getQuantity()).sum();

            if (totalPrice >= freeShippingThreshold) {
                shippingFee = 0;
            }

            int remainingForFreeShipping = Math.max(0, freeShippingThreshold - totalPrice);

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("totalPrice", totalPrice + shippingFee);
            request.setAttribute("shippingFee", shippingFee);
            request.setAttribute("remainingForFreeShipping", remainingForFreeShipping);
            request.setAttribute("account", account);

            RequestDispatcher dispatcher = request.getRequestDispatcher("purchase.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp?status=failed");
        } finally {
            DBUtil.closeResources(conn, stmt, rs);
        }
    }
}