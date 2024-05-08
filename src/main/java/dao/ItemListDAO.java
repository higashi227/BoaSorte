package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.ItemView;
import utils.DBUtil;

public class ItemListDAO {
    public static List<ItemView> getAllItems() throws SQLException {
        List<ItemView> items = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM boasorte.item");
            rs = stmt.executeQuery();

            while (rs.next()) {
                ItemView item = new ItemView();
                item.setId(rs.getInt("item_id"));
                item.setName(rs.getString("name"));
                item.setImagePath(rs.getString("image_path"));
                item.setPrice(rs.getDouble("price"));
                item.setCoffee(rs.getBoolean("is_coffee"));
                items.add(item);
            }
        } finally {
            DBUtil.closeResources(conn, stmt, rs);
        }

        return items;
    }
}
