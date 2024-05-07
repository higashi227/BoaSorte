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
	 public void addOrUpdateCart(int accountId, int itemId, int quantity) throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBUtil.getConnection();

	            // 既存のカートアイテムを探す
	            String checkQuery = "SELECT quantity FROM boasorte.cart WHERE account_id = ? AND item_id = ?";
	            stmt = conn.prepareStatement(checkQuery);
	            stmt.setInt(1, accountId);
	            stmt.setInt(2, itemId);
	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                // 既存のアイテムがある場合、数量を更新
	                int existingQuantity = rs.getInt("quantity");
	                int newQuantity = existingQuantity + quantity;

	                String updateQuery = "UPDATE boasorte.cart SET quantity = ? WHERE account_id = ? AND item_id = ?";
	                stmt = conn.prepareStatement(updateQuery);
	                stmt.setInt(1, newQuantity);
	                stmt.setInt(2, accountId);
	                stmt.setInt(3, itemId);
	                stmt.executeUpdate();
	            } else {
	                // 既存のアイテムがない場合、新しいアイテムを追加
	                String insertQuery = "INSERT INTO boasorte.cart (account_id, item_id, quantity) VALUES (?, ?, ?)";
	                stmt = conn.prepareStatement(insertQuery);
	                stmt.setInt(1, accountId);
	                stmt.setInt(2, itemId);
	                stmt.setInt(3, quantity);
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
	                Cart cart = new Cart(cartId, accountId, itemId, quantity);
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
	            String sql =  "SELECT i.item_id, i.name, i.price, SUM(c.quantity) AS quantity " +
                        	  "FROM boasorte.cart c " +
                        	  "JOIN boasorte.item i ON c.item_id = i.item_id " +
                        	  "WHERE c.account_id = ? " +
                        	  "GROUP BY i.item_id, i.name, i.price " +
                        	  "ORDER BY i.item_id ASC";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, accountId);
	            rs = stmt.executeQuery();

	            while (rs.next()) {
	                int itemId = rs.getInt("item_id");
	                String name = rs.getString("name");
	                int price = rs.getInt("price");
	                int quantity = rs.getInt("quantity");
	              
	                CartItem cartItem = new CartItem(itemId, name, price, quantity );
	                cartItems.add(cartItem);
	            }
	        } finally {
	            DBUtil.closeResources(conn, stmt, rs);
	        }

	        return cartItems;
	    }
	 
	  public void updateCartQuantity(int accountId, int itemId, int quantity) throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            conn = DBUtil.getConnection();
	            String sql = "UPDATE boasorte.cart SET quantity = ? WHERE account_id = ? AND item_id = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, quantity);
	            stmt.setInt(2, accountId);
	            stmt.setInt(3, itemId);
	            stmt.executeUpdate();
	        } finally {
	            DBUtil.closeResources(conn, stmt, null);
	        }
	    }

	    public void removeFromCart(int accountId, int itemId) throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            conn = DBUtil.getConnection();
	            String sql = "DELETE FROM boasorte.cart WHERE account_id = ? AND item_id = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, accountId);
	            stmt.setInt(2, itemId);
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
	            List<Cart> cartItems = cartDAO.getCartByAccountId(accountId);

	            // 取得したカートリストを表示
	            for (Cart cart : cartItems) {
	                System.out.println(cart);
	            }

	            // 別のメソッドの出力例
	            List<CartItem> detailedCartItems = cartDAO.getGroupedCartItemsByAccountId(accountId);
	            for (CartItem cartItem : detailedCartItems) {
	                System.out.println(cartItem);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}