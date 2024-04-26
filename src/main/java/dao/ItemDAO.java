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
	public List<Item> getAllItems() throws SQLException {
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
	            boolean isCoffee = rs.getBoolean("is_coffee");
	            Item item = new Item(itemId, name, price, isCoffee);
	            itemList.add(item);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e; // SQLExceptionを再スローする
	    } finally {
	        // リソースの解放
	        DBUtil.closeConnection(conn, stmt, rs);
	    }
	    
	    return itemList;
	}

	public void addItem(Item item) {
		// TODO 自動生成されたメソッド・スタブ
		
	}
}
