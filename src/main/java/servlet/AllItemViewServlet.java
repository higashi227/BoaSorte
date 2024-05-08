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

@WebServlet("/allItems")
public class AllItemViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ItemView> items = null;
        try {
            items = ItemListDAO.getAllItems();
        } catch (SQLException e) {
            // エラーログを記録するか、エラーページにリダイレクトするなどの適切な処理を行う
            e.printStackTrace();
        }
        request.setAttribute("items", items);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
