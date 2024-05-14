package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBUtil;

public class DashboardDAO {

	//どうやってこのサイトを知ったかの集計

	public static List<Object[]> getReferralCounts() throws SQLException {
		List<Object[]> referralCounts = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//Map<String, Integer> referralCounts = new HashMap<>();//Mapインスタンス生成

		try {
			conn = DBUtil.getConnection(); // DB接続

			// SQLクエリを定義（アカウントテーブルからどうやってサイトを知ったかを人数でカウント）
			String sql = "SELECT recognition,COUNT(*) FROM boasorte.account GROUP BY recognition";

			// ステートメントを作成
			stmt = conn.prepareStatement(sql);

			// クエリを実行し、結果を取得
			rs = stmt.executeQuery();
		
			while (rs.next()) {
				String recognition = rs.getString("recognition");
				int count = rs.getInt(2);
				Object[] data = {recognition, count};
				referralCounts.add(data);
				
				
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

	//商品ごとの購入回数を集計
	public static List<Object[]> getpurchaseCounts() throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Object[]> purchaseCounts = new ArrayList<>();

		try {
			conn = DBUtil.getConnection(); // DB接続


			// SQLクエリを定義（オーダーテーブルからitemr_idをグループにし購入回数をカウント）
			String sql = "SELECT  item_id, COUNT(*) AS purchase_count, CASE\n"
					+ "WHEN COUNT(*) = 1 THEN '初回' ELSE 'それ以上' END AS purchase_type\n"
					+ "FROM boasorte.order GROUP BY item_id";

			// ステートメントを作成
			stmt = conn.prepareStatement(sql);

			// クエリを実行し、結果を取得
			rs = stmt.executeQuery();

			// 結果セットから商品ごとの購入回数を取得または作成して、購入回数を設定
			while (rs.next()) {
				long itemId = rs.getLong("item_id");
				int count = rs.getInt("purchase_count");
				Object[] data = {itemId, count};
				purchaseCounts.add(data);
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
	public static List<Object[]> getregionCounts() throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Object[]> regionCounts = new ArrayList<>();

		try {
			conn = DBUtil.getConnection(); // DB接続

			// SQLクエリを定義（商品をSUBSTRING_INDEXで文字列検索し地域別に購入回数をカウント）
			String sql = "SELECT item_id, SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(address, '都', +1), '道', +1), '府', +1), '県', +1) AS region, COUNT(*) AS purchase_count FROM boasorte.order\n"
					+ "JOIN boasorte.account ON boasorte.order.account_id = boasorte.account.account_id\n"
					+ "GROUP BY item_id, region; ";

			// ステートメントを作成
			stmt = conn.prepareStatement(sql);

			// クエリを実行し、結果を取得
			rs = stmt.executeQuery();

			// 結果セットから地域ごとの商品購入回数を取得または作成して、購入回数を設定
			while (rs.next()) {
				long itemId = rs.getLong("item_id");
				String region = rs.getString("region");
				int count = rs.getInt("purchase_count");
				Object[] data = {itemId, region, count};
				regionCounts.add(data);
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

