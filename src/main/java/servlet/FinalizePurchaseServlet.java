package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import dao.CartDAO;
import dao.OrderDAO;
import jakarta.servlet.RequestDispatcher;
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
        String deliveryDate = request.getParameter("deliveryDate");
        String paymentMethod = request.getParameter("paymentMethod");
        
        List<Order> orders = new ArrayList<>();
        LocalDate currentDate = LocalDate.now();
        Date createdAt = Date.valueOf(currentDate);

        // Loop through each item and create orders
        for (int i = 0; i < 100; i++) { // 100 is the assumed maximum number of items
            String itemIdKey = "item_" + i + "_itemId";
            if (request.getParameter(itemIdKey) == null) break; // Exit loop if no more parameters

            int itemId = Integer.parseInt(request.getParameter(itemIdKey));
            int quantity = Integer.parseInt(request.getParameter("item_" + i + "_quantity"));
            int price = Integer.parseInt(request.getParameter("item_" + i + "_price"));
            int isCoffee = Integer.parseInt(request.getParameter("item_" + i + "_isCoffee"));
            String coffeeStatus = isCoffee == 1 ? request.getParameter("item_" + i + "_coffeeStatus") : "お菓子";

            Order order = new Order(0, accountId, itemId, quantity, price, shippingFee, coffeeStatus, createdAt, null);
            orders.add(order);
        }

        // Save orders to the database
        try {
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.saveOrders(orders);

            // Clear the cart
            CartDAO cartDAO = new CartDAO();
            cartDAO.clearCart(accountId);
            
            // Pass delivery date to the success page
            request.setAttribute("deliveryDate", deliveryDate);
            request.setAttribute("cartItems", orders); // Reuse the order list for display
            request.setAttribute("shippingFee", shippingFee);
            request.setAttribute("paymentMethod", paymentMethod);
            int totalPrice = orders.stream().mapToInt(order -> order.getPrice() * order.getQuantity()).sum();
            request.setAttribute("totalPrice", totalPrice);
            RequestDispatcher dispatcher = request.getRequestDispatcher("purchase-success.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("purchase.jsp?status=failed");
        }
    }
}