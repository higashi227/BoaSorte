package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import utils.DBUtil;


@WebServlet("/order-history")
public class AdminOrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// データベースから注文履歴を取得する処理
		List<Order> orderHistory = getOrderHistory();

		// JSPに注文履歴を渡す
		request.setAttribute("orderHistory", orderHistory);

		// JSPにフォワードする
		request.getRequestDispatcher("/adminorder.jsp").forward(request, response);
	}

	private List<Order> getOrderHistory() {
		List<Order> orderHistory = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT o.order_id, o.account_id, o.item_id, o.quantity, o.price, o.postage, o.coffee_status, o.created_at, o.updated_at, " +
					"a.name AS account_name, i.name AS item_name " +
					"FROM boasorte.order o " +
					"INNER JOIN boasorte.account a ON o.account_id = a.account_id " +
					"INNER JOIN boasorte.item i ON o.item_id = i.item_id";

			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Order order = new Order(
						rs.getInt("order_id"),
						rs.getInt("account_id"),
						rs.getInt("item_id"),
						rs.getInt("quantity"),
						rs.getInt("price"),
						rs.getInt("postage"),
						rs.getString("coffee_status"),
						rs.getDate("created_at"),
						rs.getDate("updated_at")
						);
				// アカウント名と商品名をセット
				order.setAccountName(rs.getString("account_name"));
				order.setItemName(rs.getString("item_name"));
				orderHistory.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeResources(conn, stmt, rs);
		}

		return orderHistory;
	}

}

