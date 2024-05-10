package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
        // 必要なHTTPヘッダーを設定する
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        try {
            // 商品リストを取得
            List<ItemView> items = ItemListDAO.getAllItems();

            // JSON形式のデータを手動で構築する
            StringBuilder json = new StringBuilder();
            json.append("[");
            for (int i = 0; i < items.size(); i++) {
                ItemView item = items.get(i);
                json.append("{");
                json.append("\"name\":\"").append(item.getName()).append("\",");
                json.append("\"price\":").append(item.getPrice()).append(",");
                json.append("\"imagePath\":\"").append(item.getImagePath()).append("\",");
                json.append("\"isCoffee\":").append(item.isCoffee());
                json.append("}");
                if (i < items.size() - 1) {
                    json.append(",");
                }
            }
            json.append("]");

            // JSON形式のデータをレスポンスに書き込む
            out.print(json.toString());
        } catch (SQLException e) {
            // エラー処理
            e.printStackTrace();
            // エラーレスポンスを返す
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Internal Server Error\"}");
        } finally {
            out.flush();
            out.close();
        }
    }
}
