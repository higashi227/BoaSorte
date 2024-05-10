package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import utils.DBUtil;

public class DashboardDAO {
	
	//どうやってこのサイトを知ったかの集計
	
	//Mapはサイトを知ったかをキーにし人数を値にする
	 public static Map<String, Integer> getReferralCounts() throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        Map<String, Integer> referralCounts = new HashMap<>();//Mapインスタンス生成
	        
	    try {
	        conn = DBUtil.getConnection(); // DB接続

	        // SQLクエリを定義（アカウントテーブルからどうやってサイトを知ったかを人数でカウント）
	        String sql = "SELECT recognition,COUNT(*) FROM boasorte.account GROUP BY recognition";

	        // ステートメントを作成
	        stmt = conn.prepareStatement(sql);

	        // クエリを実行し、結果を取得
	        rs = stmt.executeQuery();

	        // 結果セットから商品情報を取得
	        while (rs.next()) {
                String recognition = rs.getString("recognition");
                int count = rs.getInt(2);
                referralCounts.put(recognition, count);//Mapに追加
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e; // SQLExceptionを再スローする
	    } finally {
	        // リソースの解放
	        DBUtil.closeResources(conn, stmt, rs);
	    }
	    return referralCounts;
	 }

	 
	 
	 //商品の購入回数を集計
	 
	//外側のMapはアカウントIDをキーに内側のMapは商品IDをキーにして購入回数を値とする
	 public static Map<String, Map<Long,  Integer>> getpurchaseCounts() throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        Map<String, Map<Long,  Integer>> purchaseCounts = new HashMap<>();
	        
	    try {
	        conn = DBUtil.getConnection(); // DB接続
	        
	     // SQLクエリを定義（オーダーテーブルからaccount_idとorder_idをグループにし購入回数をカウント）
	        String sql = "SELECT account_id,order_id, COUNT(*) AS purchase_count FROM boasorte.order GROUP BY account_id,order_id";
	        
	        // ステートメントを作成
	        stmt = conn.prepareStatement(sql);

	        // クエリを実行し、結果を取得
	        rs = stmt.executeQuery();

	        // 結果セットからアカウントID、注文ID、購入回数を取得
	        while (rs.next()) {
                String accountId = rs.getString("account_id");
                long orderId = rs.getLong("order_id");
                int count = rs.getInt("purchase_count");
                
             // アカウントごとの商品購入回数のマップを取得または作成して、購入回数を設定
                Map<Long, Integer> productCounts = purchaseCounts.getOrDefault(accountId, new HashMap<>());
                productCounts.put(orderId, count);
                purchaseCounts.put(accountId, productCounts);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e; // SQLExceptionを再スローする
	    } finally {
	        // リソースの解放
	        DBUtil.closeResources(conn, stmt, rs);
	    }

	    return purchaseCounts;
	 }
	 
	 //商品がどの地域で購入されているか集計
	 
	 public static Map<String, Map<Long,  Integer>> getregionCounts() throws SQLException {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        Map<String, Map<Long,  Integer>> regionCounts = new HashMap<>();
	        
	    try {
	        conn = DBUtil.getConnection(); // DB接続
	        
	     // SQLクエリを定義（オーダーテーブルからaccount_idとorder_idをグループにし購入回数をカウント）
	        String sql = "SELECT COUNT(*) FROM boasorte.order GROUP BY ";
	        
	        // ステートメントを作成
	        stmt = conn.prepareStatement(sql);

	        // クエリを実行し、結果を取得
	        rs = stmt.executeQuery();

	        // 結果セットからアカウントID、注文ID、購入回数を取得
	        while (rs.next()) {
             String accountId = rs.getString("account_id");
             long orderId = rs.getLong("order_id");
             int count = rs.getInt("purchase_count");
             
          // アカウントごとの商品購入回数のマップを取得または作成して、購入回数を設定
             Map<Long, Integer> productCounts = regionCounts.getOrDefault(accountId, new HashMap<>());
             productCounts.put(orderId, count);
             regionCounts.put(accountId, productCounts);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e; // SQLExceptionを再スローする
	    } finally {
	        // リソースの解放
	        DBUtil.closeResources(conn, stmt, rs);
	    }

	    return regionCounts;
	 }
	 
	 }
