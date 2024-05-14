package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DBUtil;
import model.OrderDetail;


@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getSession().getAttribute("accountId").toString());  // セッションからアカウントIDを取得
        List<OrderDetail> orderDetails = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT o.order_id, o.quantity, o.price, o.postage, o.coffee_status, o.created_at, i.name AS item_name, (o.quantity * o.price + o.postage) AS total_amount FROM boasorte.order o JOIN boasorte.item i ON o.item_id = i.item_id WHERE o.account_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, accountId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    orderDetails.add(new OrderDetail(rs.getInt("order_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("postage"), rs.getString("coffee_status"), rs.getDate("created_at"), rs.getString("item_name"), rs.getInt("total_amount")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("orderDetails", orderDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("order_history.jsp");
        dispatcher.forward(request, response);
    }
}