package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

@WebServlet("/AdminItemAddServlet")
public class AdminItemAddServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// フォームから送られてきた商品情報を取得
		String name = request.getParameter("name");
		String priceStr = request.getParameter("price");
		int price;
		if (priceStr != null && !priceStr.isEmpty()) {
		    price = Integer.parseInt(priceStr);
		} else {
		    // エラー処理（価格が指定されていない場合）
		    System.out.println("価格が指定されていません");
		    request.getRequestDispatcher("/error.jsp").forward(request, response);
		    return;
		}
		boolean isCoffee = request.getParameter("is_coffee") != null; // チェックボックスがチェックされているか
		
		
		// 新規登録する備品情報を設定
        Item newItem = new Item();
        newItem.setName(name);
        newItem.setPrice(price);
        newItem.setIsCoffee(isCoffee);


		// 商品情報をデータベースに追加		
		ItemDAO itemDAO = new ItemDAO();
        try {
            dao.ItemDAO.addItem(newItem);
            List<Item> updatedItems = ItemDAO.getAllItems();
            request.setAttribute("itemList", updatedItems);
            response.sendRedirect("adminmanagement.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            
            System.out.println("最後でエラー");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
        
		}
	}
	
	