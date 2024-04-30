package servlet;

import java.io.IOException;

//import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import model.Item;

@WebServlet("/AdminItemEditServlet")
public class AdminItemEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*
    	// 選択した商品のIDを取得
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        
        // 商品情報を取得
        ItemDAO itemDAO = new ItemDAO();
        Item item = null;
        item = itemDAO.getItemById(itemId);
        
        // 商品情報をリクエスト属性に設定
        request.setAttribute("item", item);*/
        
        // 編集画面にフォワード
        request.getRequestDispatcher("adminitemedit.jsp").forward(request, response);
    }
}
