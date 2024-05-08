package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Item;
import utils.DBUtil;

public class ItemDAO {

	// 商品情報を取得するメソッド
	public static List<Item> getAllItems() throws SQLException {
		List<Item> itemList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection(); // DB接続

			// SQLクエリを定義
			String sql = "SELECT * FROM boasorte.item";

			// ステートメントを作成
			stmt = conn.prepareStatement(sql);

			// クエリを実行し、結果を取得
			rs = stmt.executeQuery();

			// 結果セットから商品情報を取得し、リストに追加
			while (rs.next()) {
				int itemId = rs.getInt("item_id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int isCoffee = rs.getInt("is_coffee"); // TINYINTをint型で取得
				Item item = new Item(itemId, name, price, isCoffee);
				itemList.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e; // SQLExceptionを再スローする
		} finally {
			// リソースの解放
			DBUtil.closeResources(conn, stmt, rs);
		}

		return itemList;
	}
	// 商品を新規登録するメソッド
	public static void addItem(Item item) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection(); // DB接続

			// SQLクエリを定義
			String sql = "INSERT INTO boasorte.item (name, price, is_coffee) VALUES (?, ?, ?)";

			// ステートメントを作成
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, item.getName());
			stmt.setInt(2, item.getPrice());
			stmt.setInt(3, item.getIsCoffee()); // int型として設定

			// クエリを実行
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e; // SQLExceptionを再スローする
		} finally {
			// リソースの解放
			DBUtil.closeResources(conn, stmt, rs);
		}
	}



	//商品を編集するメソッド
	public static boolean updateItem(Item item) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean success = false;

		try {
			conn = DBUtil.getConnection(); // DB接続

			// SQLクエリを定義
			String sql = "UPDATE boasorte.item SET name = ?, price = ?, is_coffee = ? WHERE item_id = ?";

			// ステートメントを作成
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, item.getName());
			stmt.setInt(2, item.getPrice());
			stmt.setInt(3, item.getIsCoffee());
			stmt.setInt(4, item.getItemId()); // item_idを設定

			// クエリを実行
			int rowsAffected = stmt.executeUpdate();
			
			// 更新が成功したかどうかを判定
			success = rowsAffected > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e; // SQLExceptionを再スローする
			
		} finally {
			// リソースの解放
			DBUtil.closeResources(conn, stmt, null);
		}
		return success;
	}
	
	
		// 商品IDを指定して商品情報を取得するメソッド
		public static Item getItemById(int itemId) throws SQLException {
		    Connection conn = null;
		    PreparedStatement stmt = null;
		    ResultSet rs = null;
		    Item item = null;

		    try {
		        conn = DBUtil.getConnection(); // DB接続

		        // SQLクエリを定義
		        String sql = "SELECT * FROM boasorte.item WHERE item_id = ?";

		        // ステートメントを作成
		        stmt = conn.prepareStatement(sql);
		        stmt.setInt(1, itemId);

		        // クエリを実行し、結果を取得
		        rs = stmt.executeQuery();

		        // 結果セットから商品情報を取得
		        if (rs.next()) {
		            String name = rs.getString("name");
		            int price = rs.getInt("price");
		            int isCoffee = rs.getInt("is_coffee");
		            item = new Item(itemId, name, price, isCoffee);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        throw e; // SQLExceptionを再スローする
		    } finally {
		        // リソースの解放
		        DBUtil.closeResources(conn, stmt, rs);
		    }

		    return item;
		}

		// 商品を削除するメソッド
		public static void deleteItem(int itemId) throws SQLException {
		    Connection conn = null;
		    PreparedStatement stmt = null;

		    try {
		        conn = DBUtil.getConnection(); // DB接続

		        // SQLクエリを定義
		        String sql = "DELETE FROM boasorte.item WHERE item_id = ?";

		        // ステートメントを作成
		        stmt = conn.prepareStatement(sql);
		        stmt.setInt(1, itemId);

		        // クエリを実行
		        stmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		        throw e; // SQLExceptionを再スローする
		    } finally {
		        // リソースの解放
		        DBUtil.closeResources(conn, stmt, null);
		    }
		}



}
