package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cart;
import model.CartItem;
import utils.DBUtil;

public class CartDAO {
	 public void addOrUpdateCart(int accountId, int itemId, int quantity, String coffeeStatus) throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBUtil.getConnection();
	            String checkSql = "SELECT * FROM boasorte.cart WHERE account_id = ? AND item_id = ? AND coffee_status = ?";
	            stmt = conn.prepareStatement(checkSql);
	            stmt.setInt(1, accountId);
	            stmt.setInt(2, itemId);
	            stmt.setString(3, coffeeStatus);
	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                // アイテムがすでにカートにある場合、数量を更新
	                String updateSql = "UPDATE boasorte.cart SET quantity = quantity + ? WHERE account_id = ? AND item_id = ? AND coffee_status = ?";
	                stmt = conn.prepareStatement(updateSql);
	                stmt.setInt(1, quantity);
	                stmt.setInt(2, accountId);
	                stmt.setInt(3, itemId);
	                stmt.setString(4, coffeeStatus);
	                stmt.executeUpdate();
	            } else {
	                // 新しいアイテムをカートに追加
	                String insertSql = "INSERT INTO boasorte.cart (account_id, item_id, quantity, coffee_status) VALUES (?, ?, ?, ?)";
	                stmt = conn.prepareStatement(insertSql);
	                stmt.setInt(1, accountId);
	                stmt.setInt(2, itemId);
	                stmt.setInt(3, quantity);
	                stmt.setString(4, coffeeStatus);
	                stmt.executeUpdate();
	            }
	        } finally {
	            DBUtil.closeResources(conn, stmt, rs);
	        }
	    }
	 public List<Cart> getCartByAccountId(int accountId) throws SQLException {
	        List<Cart> cartItems = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	   

	        try {
	        		conn = DBUtil.getConnection();
	                stmt = conn.prepareStatement("SELECT * FROM boasorte.cart WHERE account_id = ?");
	                stmt.setInt(1, accountId);
	                rs = stmt.executeQuery();

	            while (rs.next()) {
	                int cartId = rs.getInt("cart_id");
	                int itemId = rs.getInt("item_id");
	                int quantity = rs.getInt("quantity");
	                String coffeeStatus = rs.getString("coffeeStatus");
	                Cart cart = new Cart(cartId, accountId, itemId, quantity, coffeeStatus);
	                cartItems.add(cart);
	            }
	        }  catch (SQLException e) {
	            e.printStackTrace();
	            System.err.println("データベースエラー: " + e.getMessage());
	        } finally {
	            DBUtil.closeResources(conn, stmt, rs);
	        }
	        return cartItems;
	    }
	 
	 public List<CartItem> getGroupedCartItemsByAccountId(int accountId) throws SQLException {
	        List<CartItem> cartItems = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBUtil.getConnection();
	            String sql = "SELECT i.item_id, i.name, i.price, i.is_coffee, SUM(c.quantity) AS quantity, c.coffee_status " +
	                         "FROM boasorte.cart c " +
	                         "JOIN boasorte.item i ON c.item_id = i.item_id " +
	                         "WHERE c.account_id = ? " +
	                         "GROUP BY i.item_id, i.name, i.price, i.is_coffee, c.coffee_status " +
	                         "ORDER BY i.item_id ASC";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, accountId);
	            rs = stmt.executeQuery();

	            while (rs.next()) {
	                int itemId = rs.getInt("item_id");
	                String name = rs.getString("name");
	                int price = rs.getInt("price");
	                int isCoffee = rs.getInt("is_coffee");
	                int quantity = rs.getInt("quantity");
	                String coffeeStatus = rs.getString("coffee_status");
	                CartItem cartItem = new CartItem(itemId, name, price, quantity, isCoffee, coffeeStatus);
	                cartItems.add(cartItem);
	            }
	        } finally {
	            DBUtil.closeResources(conn, stmt, rs);
	        }

	        return cartItems;
	    }
	 
	 public void updateCartQuantity(int accountId, int itemId, int quantity, String coffeeStatus) throws SQLException {
		    Connection conn = null;
		    PreparedStatement stmt = null;

		    try {
		        conn = DBUtil.getConnection();
		        String sql = "UPDATE boasorte.cart SET quantity = ? WHERE account_id = ? AND item_id = ? AND coffee_status = ?";
		        stmt = conn.prepareStatement(sql);
		        stmt.setInt(1, quantity);
		        stmt.setInt(2, accountId);
		        stmt.setInt(3, itemId);
		        stmt.setString(4, coffeeStatus);
		        stmt.executeUpdate();
		    } finally {
		        DBUtil.closeResources(conn, stmt, null);
		    }
		}

	    public void removeFromCart(int accountId, int itemId, String coffeeStatus) throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            conn = DBUtil.getConnection();
	            String sql = "DELETE FROM boasorte.cart WHERE account_id = ? AND item_id = ? AND coffee_status = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, accountId);
	            stmt.setInt(2, itemId);
	            stmt.setString(3, coffeeStatus);
	            stmt.executeUpdate();
	        } finally {
	            DBUtil.closeResources(conn, stmt, null);
	        }
	    }

	    // カートをクリアするメソッド
	    public void clearCart(int accountId) throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            conn = DBUtil.getConnection();
	            String sql = "DELETE FROM boasorte.cart WHERE account_id = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, accountId);
	            stmt.executeUpdate();
	        } finally {
	            DBUtil.closeResources(conn, stmt, null);
	        }
	    }

	    // 表示用のメインメソッド
	    public static void main(String[] args) {
	        CartDAO cartDAO = new CartDAO();
	        try {
	            int accountId = 2; // 例として指定するアカウントID
	            List<CartItem> detailedCartItems = cartDAO.getGroupedCartItemsByAccountId(accountId);
	            for (CartItem cartItem : detailedCartItems) {
	                System.out.println(cartItem);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}