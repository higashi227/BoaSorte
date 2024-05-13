package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.CartDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
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
    	int itemId = Integer.parseInt(request.getParameter("itemId")); // "itemId" パラメータを取得
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String coffeeStatus = request.getParameter("coffeeStatus");
        if (coffeeStatus == null) {
        	coffeeStatus = "0";
		}
        try {
            CartDAO cartDAO = new CartDAO();
            cartDAO.addOrUpdateCart(accountId, itemId, quantity, coffeeStatus);
            response.sendRedirect("CartServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("main.jsp?status=failed");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isUserLoggedIn(request, response)) {
            return;
        }

        int accountId = (Integer) request.getSession().getAttribute("accountId");
        CartDAO cartDAO = new CartDAO();

        try {
            List<CartItem> cartItems = cartDAO.getGroupedCartItemsByAccountId(accountId);
            request.setAttribute("cartItems", cartItems);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("DB error when fetching cart items", e);
        }
    }
}