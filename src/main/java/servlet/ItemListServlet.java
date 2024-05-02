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

@WebServlet("/ItemListServlet")
public class ItemListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 商品情報を取得
        ItemDAO itemDAO = new ItemDAO();
        List<Item> itemList = null;
        try {
			itemList = ItemDAO.getAllItems();
		} catch (SQLException e) {
			// SQLエラーが発生した場合の処理
			request.setAttribute("errorMessage", "商品情報の取得中にエラーが発生しました。");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return; // エラーページにフォワードした後は、処理を終了する
		}

        // 商品情報が取得できなかった場合の処理
        if (itemList == null) {
            request.setAttribute("errorMessage", "商品情報が見つかりませんでした。");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        // 取得した商品情報をリクエスト属性に設定
        request.setAttribute("itemList", itemList);

        // 商品一覧ページにフォワード
        request.getRequestDispatcher("adminmanagement.jsp").forward(request, response);
    }

   /* protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        int isCoffee = "1".equals(request.getParameter("is_coffee")) ? 1 : 0; // チェックボックスがチェックされているかをint型で取得

        // 新規登録する備品情報を設定
        Item newItem = new Item();
        newItem.setName(name);
        newItem.setPrice(price);
        newItem.setIsCoffee(isCoffee);

        // 商品情報をデータベースに追加
        ItemDAO itemDAO = new ItemDAO();
        try {
            ItemDAO.addItem(newItem);
            List<Item> updatedItems = ItemDAO.getAllItems();
            request.setAttribute("itemList", updatedItems);
            response.sendRedirect("ItemListServlet");
        } catch (SQLException e) {
            e.printStackTrace();

            System.out.println("最後でエラー");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }*/
}

