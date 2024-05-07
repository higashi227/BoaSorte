package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import model.Order;
import utils.DBUtil;

public class OrderDAO {
    public void saveOrders(List<Order> orders) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO boasorte.`order` (account_id, item_id, quantity, price, postage, coffee_status, created_at) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";

            stmt = conn.prepareStatement(sql);

            for (Order order : orders) {
                stmt.setInt(1, order.getAccountId());
                stmt.setInt(2, order.getItemId());
                stmt.setInt(3, order.getQuantity());
                stmt.setInt(4, order.getPrice());
                stmt.setInt(5, order.getPostage());
                stmt.setString(6, order.getCoffeeStatus());
                stmt.setDate(7, order.getCreatedAt());
                stmt.addBatch();
            }

            stmt.executeBatch();
        } finally {
            DBUtil.closeResources(conn, stmt, null);
        }
    }
}