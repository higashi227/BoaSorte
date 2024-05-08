package servlet;

import java.io.IOException;
import java.sql.SQLException; // SQLExceptionをimportします

import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

@WebServlet("/AdminItemUpdateServlet")
public class AdminItemUpdateServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // フォームからパラメータを取得
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int isCoffee = Integer.parseInt(request.getParameter("is_coffee"));

            // 更新された情報を持つItemオブジェクトを作成
            Item item = new Item(id, name, price, isCoffee);
            
            // データベース内のアイテムを更新
            ItemDAO itemDAO = new ItemDAO();
            boolean success = itemDAO.updateItem(item);

            // 更新結果に基づいて成功またはエラーページにリダイレクトする
            if (success) {
                response.sendRedirect("adminitemsuccess.jsp"); // 成功した場合はsuccess.jspにリダイレクトします（成功した更新のためのsuccess.jspページを作成できます）
            } else {
                response.sendRedirect("error.jsp"); // 失敗した場合はerror.jspにリダイレクトします（失敗した更新のためのerror.jspページを作成できます）
            }
        } catch (SQLException e) {
            // SQLエラーが発生した場合の処理
            e.printStackTrace(); // エラーのスタックトレースを出力します（開発中のデバッグに役立ちます）
            response.sendRedirect("error.jsp"); // エラーページにリダイレクトします
        } catch (NumberFormatException e) {
            // 数値のパースエラーが発生した場合の処理
            e.printStackTrace(); // エラーのスタックトレースを出力します（開発中のデバッグに役立ちます）
            response.sendRedirect("error.jsp"); // エラーページにリダイレクトします
        }
    }
}
