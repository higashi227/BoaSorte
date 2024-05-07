package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;

@WebServlet("/FinalizePurchaseServlet")
public class FinalizePurchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private boolean isUserLoggedIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountId") == null) {
            response.sendRedirect("login.jsp");
            System.out.println("ログインしてください");
            return false;
        }
        return true;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isUserLoggedIn(request, response)) {
            return;
        }

        int accountId = (Integer) request.getSession().getAttribute("accountId");
        int shippingFee = Integer.parseInt(request.getParameter("shippingFee"));

        List<Order> orders = new ArrayList<>();
        LocalDate currentDate = LocalDate.now();
        Date createdAt = Date.valueOf(currentDate);

        // 商品情報とコーヒー状態を取得
        Enumeration<String> paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = paramNames.nextElement();
            if (paramName.startsWith("itemId_")) {
                int itemId = Integer.parseInt(request.getParameter(paramName));
                int quantity = Integer.parseInt(request.getParameter("quantity_" + itemId));
                int price = Integer.parseInt(request.getParameter("price_" + itemId));
                String coffeeStatus = request.getParameter("coffeeStatus_" + itemId);

                Order order = new Order(0, accountId, itemId, quantity, price, shippingFee, coffeeStatus, createdAt, null);
                orders.add(order);
            }
        }

        // データベースに保存
        try {
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.saveOrders(orders);
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("purchase.jsp?status=failed");
        }
    }
}