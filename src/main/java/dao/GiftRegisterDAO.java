package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Gift;
import utils.DBUtil;

public class GiftRegisterDAO {
    // ギフト先情報をデータベースに登録する
    public void registerGift(int accountId, String gname, String gpostnum, String gaddress) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement("INSERT INTO boasorte.gift (account_id, gname, gpostnum, gaddress) VALUES (?, ?, ?, ?)");
            stmt.setInt(1, accountId);
            stmt.setString(2, gname);
            stmt.setString(3, gpostnum);
            stmt.setString(4, gaddress);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("データベースエラー: " + e.getMessage());
        } finally {
            DBUtil.closeResources(conn, stmt, null);
        }
    }
    
    // 指定されたアカウントIDに紐づくギフト先情報を取得する
    public List<Gift> getGiftsByAccountId(int accountId) {
        List<Gift> gifts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM boasorte.gift WHERE account_id = ?");
            stmt.setInt(1, accountId);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int giftId = rs.getInt("gift_id");
                String gname = rs.getString("gname");
                String gpostnum = rs.getString("gpostnum");
                String gaddress = rs.getString("gaddress");
                Gift gift = new Gift(giftId, accountId, gname, gpostnum, gaddress);
                gifts.add(gift);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("データベースエラー: " + e.getMessage());
        } finally {
            DBUtil.closeResources(conn, stmt, rs);
        }
        return gifts;
    }
}
