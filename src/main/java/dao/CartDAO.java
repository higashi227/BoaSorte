package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import utils.DBUtil;

public class CartDAO {
    
    // カートに商品を追加
    public boolean addToCart(int accountId, int itemId, int quantity) throws SQLException {
        String sql = "INSERT INTO boasorte.cart (account_id, item_id, quantity) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            stmt.setInt(2, itemId);
            stmt.setInt(3, quantity);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw new SQLException("Error adding item to cart", e);
        }
    }

    // カートから商品を削除
    public boolean removeFromCart(int cartId) throws SQLException {
        String sql = "DELETE FROM boasorte.cart WHERE cart_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw new SQLException("Error removing item from cart", e);
        }
    }

    // 特定のユーザーのカート内容を取得
    public List<Cart> getCartByAccountId(int accountId) throws SQLException {
        List<Cart> cartList = new ArrayList<>();
        String sql = "SELECT cart_id, item_id, quantity FROM boasorte.cart WHERE account_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setCartId(rs.getInt("cart_id"));
                    cart.setAccountId(accountId);
                    cart.setItemId(rs.getInt("item_id"));
                    cart.setQuantity(rs.getInt("quantity"));
                    cartList.add(cart);
                }
            }
            return cartList;
        } catch (SQLException e) {
            throw new SQLException("Error fetching cart items", e);
        }
    }
}