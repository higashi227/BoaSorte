package servlet;

import java.io.IOException;

import dao.GiftDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-gift")
public class GiftDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームから送られてきたギフトIDを取得
        int giftId = Integer.parseInt(request.getParameter("giftId"));
        
        // DAOを使用してギフトの削除処理を行う
        GiftDAO giftDAO = new GiftDAO();
        giftDAO.deleteGift(giftId);

        // 削除処理後に適切なリダイレクトやメッセージの表示を行う
        response.sendRedirect("gift-list");
    }
}
