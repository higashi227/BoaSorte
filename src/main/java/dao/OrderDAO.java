package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import utils.DBUtil;

public class OrderDAO {
    public void saveOrders(List<Order> orders) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO boasorte.order (account_id, item_id, quantity, price, postage, coffee_status, created_at, updated_at) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);

            for (Order order : orders) {
                stmt.setInt(1, order.getAccountId());
                stmt.setInt(2, order.getItemId());
                stmt.setInt(3, order.getQuantity());
                stmt.setInt(4, order.getPrice());
                stmt.setInt(5, order.getPostage());
                stmt.setString(6, order.getCoffeeStatus());
                stmt.setDate(7, order.getCreatedAt());
                stmt.setDate(8, order.getUpdatedAt());
                stmt.addBatch();
            }

            stmt.executeBatch();
        } finally {
            DBUtil.closeResources(conn, stmt, null);
        }
    }

    // 新しいメソッド: getOrdersByAccountId
    public List<Order> getOrdersByAccountId(int accountId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT o.order_id, i.name, o.price, o.quantity, o.postage, o.coffee_status " +
                         "FROM boasorte.`order` o " +
                         "JOIN boasorte.item i ON o.item_id = i.item_id " +
                         "WHERE o.account_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, accountId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                int postage = rs.getInt("postage");
                String coffeeStatus = rs.getString("coffee_status");

                Order order = new Order(orderId, accountId, 0, quantity, price, postage, coffeeStatus, null, null);
                order.setName(name);
                orders.add(order);
            }
        } finally {
            DBUtil.closeResources(conn, stmt, rs);
        }

        return orders;
    }
}