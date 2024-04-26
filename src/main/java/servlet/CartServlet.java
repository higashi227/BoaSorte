package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        CartDAO cartDAO = new CartDAO();
        try {
            boolean result = cartDAO.addToCart(accountId, itemId, quantity);
            if (result) {
                response.sendRedirect("cart.jsp?status=success");
            } else {
                response.sendRedirect("cart.jsp?status=failed");
            }
        } catch (SQLException e) {
            throw new ServletException("DB error when adding to cart", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("accountId"));

        CartDAO cartDAO = new CartDAO();
        try {
            List<Cart> cartItems = cartDAO.getCartByAccountId(accountId);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("DB error when fetching cart items", e);
        }
    }
}