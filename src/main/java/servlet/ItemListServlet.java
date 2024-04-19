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
			itemList = itemDAO.getAllItems();
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
}
