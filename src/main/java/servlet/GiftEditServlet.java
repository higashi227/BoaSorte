package servlet;

import java.io.IOException;

import dao.GiftDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit-gift")
public class GiftEditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 編集ページの表示処理はJSP内に組み込まれているため、このメソッドは空にしておく
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームから送られてきたデータを取得
        int giftId = Integer.parseInt(request.getParameter("giftId"));
        String gname = request.getParameter("gname");
        String gpostnum = request.getParameter("gpostnum");
        String gaddress = request.getParameter("gaddress");
        
        // DAOを使用してギフトの更新処理を行う
        GiftDAO giftDAO = new GiftDAO();
        giftDAO.updateGift(giftId, gname, gpostnum, gaddress);

        // 更新処理後にギフト一覧ページにリダイレクトするなどの適切な処理を行う
        response.sendRedirect("gift-list");
    }
}
