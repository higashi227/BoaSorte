package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CartItem;
import utils.DBUtil;

@WebServlet("/PurchaseConfirmationServlet")
public class PurchaseConfirmationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shippingFee = Integer.parseInt(request.getParameter("shippingFee"));
        String deliveryDate = request.getParameter("deliveryDate");
        String paymentMethod = request.getParameter("paymentMethod");

        List<CartItem> cartItems = new ArrayList<>();
        int totalPrice = 0;

        // 各インデックスに基づいて商品情報とコーヒー状態を取得
        for (int i = 0; i < 100; i++) { // 100は送信される商品の最大想定数
            String itemIdKey = "item_" + i + "_itemId";
            if (request.getParameter(itemIdKey) == null) break; // パラメータが存在しない場合はループ終了

            int itemId = Integer.parseInt(request.getParameter(itemIdKey));
            int quantity = Integer.parseInt(request.getParameter("item_" + i + "_quantity"));
            int price = Integer.parseInt(request.getParameter("item_" + i + "_price"));
            int isCoffee = Integer.parseInt(request.getParameter("item_" + i + "_isCoffee"));
            String coffeeStatus = isCoffee == 1 ? request.getParameter("item_" + i + "_coffeeStatus") : null;

            String itemName = getItemName(itemId); // アイテム名を取得

            CartItem cartItem = new CartItem(itemId, itemName, price, quantity, isCoffee, coffeeStatus);
            cartItems.add(cartItem);
            totalPrice += price * quantity;
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalPrice", totalPrice + shippingFee);
        request.setAttribute("shippingFee", shippingFee);
        request.setAttribute("deliveryDate", deliveryDate);
        request.setAttribute("paymentMethod", paymentMethod);

        RequestDispatcher dispatcher = request.getRequestDispatcher("purchase-confirmation.jsp");
        dispatcher.forward(request, response);
    }

    private String getItemName(int itemId) {
        String itemName = "";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT name FROM boasorte.item WHERE item_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, itemId);
            rs = stmt.executeQuery();
            if (rs.next()) {
                itemName = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResources(conn, stmt, rs);
        }

        return itemName;
    }
}