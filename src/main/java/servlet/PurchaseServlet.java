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
import dao.GiftRegisterDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.Gift;
import utils.DBUtil;

@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
	 private GiftRegisterDAO giftRegisterDAO;

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
        GiftRegisterDAO giftRegisterDAO = new GiftRegisterDAO();
        Map<String, String> account = new HashMap<>();
       
        int freeShippingThreshold = 3000;
        int shippingFee = 650;

        // アカウントの配送先情報を取得
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT name, postnum, address FROM boasorte.account WHERE account_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, accountId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        account.put("name", rs.getString("name"));
                        account.put("postnum", rs.getString("postnum"));
                        account.put("address", rs.getString("address"));
                    }
                }
            
  
            }

            // カート情報を取得
            List<CartItem> cartItems = cartDAO.getGroupedCartItemsByAccountId(accountId);
            int totalPrice = cartItems.stream().mapToInt(item -> item.getPrice() * item.getQuantity()).sum();
            int tax = (int) Math.floor(totalPrice * 0.1);
            if (totalPrice >= freeShippingThreshold) {
                shippingFee = 0;
            }
           
            int remainingForFreeShipping = Math.max(0, freeShippingThreshold - totalPrice);
            List<Gift> gifts = giftRegisterDAO.getGiftsByAccountId(accountId);
          

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("totalPrice", totalPrice + shippingFee);
            request.setAttribute("shippingFee", shippingFee);
            request.setAttribute("tax", tax);
            request.setAttribute("remainingForFreeShipping", remainingForFreeShipping);
            request.setAttribute("account", account);
            request.setAttribute("gifts", gifts);

            RequestDispatcher dispatcher = request.getRequestDispatcher("purchase.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cart.jsp?status=failed");
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}