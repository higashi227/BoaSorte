package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.ItemListDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ItemView;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 商品リストを取得
        List<ItemView> items = null;
        try {
            items = ItemListDAO.getAllItems();
        } catch (SQLException e) {
            // エラー処理: 適切な方法でエラーを処理する
            e.printStackTrace();
            // エラーメッセージをリクエストスコープにセット
            request.setAttribute("errorMessage", "商品リストを取得できませんでした。");
            // エラーページにフォワード
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return; // エラーページにフォワードしたら処理を終了
        }
        // リクエストスコープにセット
        request.setAttribute("items", items);
        // index.jspにフォワード
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
