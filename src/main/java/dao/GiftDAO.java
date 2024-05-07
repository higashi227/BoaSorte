package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.DBUtil;

public class GiftDAO {
    private static final String UPDATE_GIFT_QUERY = "UPDATE boasorte.gift SET gname = ?, gpostnum = ?, gaddress = ? WHERE gift_id = ?";
    private static final String DELETE_GIFT_QUERY = "DELETE FROM boasorte.gift WHERE gift_id = ?";

    // ギフトの更新処理
    public void updateGift(int giftId, String gname, String gpostnum, String gaddress) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement(UPDATE_GIFT_QUERY);
            stmt.setString(1, gname);
            stmt.setString(2, gpostnum);
            stmt.setString(3, gaddress);
            stmt.setInt(4, giftId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            // エラー処理
            e.printStackTrace();
        } finally {
            DBUtil.closeResources(conn, stmt, null);
        }
    }

    // ギフトの削除処理
    public void deleteGift(int giftId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement(DELETE_GIFT_QUERY);
            stmt.setInt(1, giftId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            // エラー処理
            e.printStackTrace();
        } finally {
            DBUtil.closeResources(conn, stmt, null);
        }
    }
}
