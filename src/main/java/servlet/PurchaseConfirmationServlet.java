package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
        

         // 選択された配送先情報を取得
         String selectedAddress = request.getParameter("selectedAddress");


         List<CartItem> cartItems = new ArrayList<>();
       

         for (int i = 0; i < 100; i++) {
             String itemIdKey = "item_" + i + "_itemId";
             if (request.getParameter(itemIdKey) == null) break;

             int itemId = Integer.parseInt(request.getParameter(itemIdKey));
             String name = request.getParameter("item_" + i + "_name");  // 名前を取得
             int quantity = Integer.parseInt(request.getParameter("item_" + i + "_quantity"));
             int price = Integer.parseInt(request.getParameter("item_" + i + "_price"));
             int isCoffee = Integer.parseInt(request.getParameter("item_" + i + "_isCoffee"));
             String coffeeStatus = isCoffee == 1 ? request.getParameter("item_" + i + "_coffeeStatus") : null;

             CartItem cartItem = new CartItem(itemId, name, price, quantity, isCoffee, coffeeStatus);
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