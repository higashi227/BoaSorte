package servlet;

import java.io.IOException;

import dao.GiftRegisterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/gift-register")
public class GiftRegisterServlet extends HttpServlet {
    private GiftRegisterDAO giftRegisterDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // GiftRegisterDAOのインスタンスを作成
        giftRegisterDAO = new GiftRegisterDAO();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountId") == null) {
            // ログインしていないか、セッションにaccountIdがない場合はエラー処理またはログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }

        int accountId = (Integer) session.getAttribute("accountId");

        // ギフト先情報をリクエストから直接取得する
        String gname = request.getParameter("gname");
        String gpostnum = request.getParameter("gpostnum");
        String gaddress = request.getParameter("gaddress");

        // ギフト先情報をデータベースに登録する
        giftRegisterDAO.registerGift(accountId, gname, gpostnum, gaddress);

        // ギフト先登録が完了したらマイページにリダイレクト
        response.sendRedirect("gift-list");
    }
}