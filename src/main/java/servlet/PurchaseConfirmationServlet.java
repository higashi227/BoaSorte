package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CartItem;

@WebServlet("/PurchaseConfirmationServlet")
public class PurchaseConfirmationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  int shippingFee = Integer.parseInt(request.getParameter("shippingFee"));
          int tax = Integer.parseInt(request.getParameter("tax"));
          int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
         String deliveryDate = request.getParameter("deliveryDate");
         String paymentMethod = request.getParameter("paymentMethod");
         String deliveryAddress = request.getParameter("deliveryAddress");
         List<Map<String, String>> accountAddresses = (List<Map<String, String>>) request.getSession().getAttribute("account");
         List<Map<String, String>> giftAddresses = (List<Map<String, String>>) request.getSession().getAttribute("gift");

         // 選択された配送先情報を取得
         Map<String, String> selectedAddress = null;
         if (deliveryAddress.startsWith("gift_")) {
             int giftId = Integer.parseInt(deliveryAddress.replace("gift_", ""));
             selectedAddress = giftAddresses.stream()
                     .filter(g -> Integer.parseInt(g.get("id").replace("gift_", "")) == giftId)
                     .findFirst()
                     .orElse(null);
         } else {
             selectedAddress = accountAddresses.stream()
                     .filter(a -> a.get("id").equals("account"))
                     .findFirst()
                     .orElse(null);
         }

         List<CartItem> cartItems = new ArrayList<>();
         int totalPrice = 0;

         for (int i = 0; i < 100; i++) {
             String itemIdKey = "item_" + i + "_itemId";
             if (request.getParameter(itemIdKey) == null) break;

             int itemId = Integer.parseInt(request.getParameter(itemIdKey));
             int quantity = Integer.parseInt(request.getParameter("item_" + i + "_quantity"));
             int price = Integer.parseInt(request.getParameter("item_" + i + "_price"));
             int isCoffee = Integer.parseInt(request.getParameter("item_" + i + "_isCoffee"));
             String coffeeStatus = isCoffee == 1 ? request.getParameter("item_" + i + "_coffeeStatus") : null;

             CartItem cartItem = new CartItem(itemId, "", price, quantity, isCoffee, coffeeStatus);
             cartItems.add(cartItem);
           
         }

         request.setAttribute("cartItems", cartItems);
         request.setAttribute("shippingFee", shippingFee);
         request.setAttribute("tax", tax);
         request.setAttribute("totalAmount", totalAmount);
         request.setAttribute("deliveryDate", deliveryDate);
         request.setAttribute("paymentMethod", paymentMethod);
         request.setAttribute("selectedAddress", selectedAddress);

         RequestDispatcher dispatcher = request.getRequestDispatcher("purchase-confirmation.jsp");
         dispatcher.forward(request, response);
     }
 

}