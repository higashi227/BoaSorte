package servlet;

import java.io.IOException;
import java.util.List;

import dao.GiftRegisterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Gift;

@WebServlet("/gift-list")
public class GiftListServlet extends HttpServlet {
    private GiftRegisterDAO giftRegisterDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        giftRegisterDAO = new GiftRegisterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ログインしているユーザーのアカウントIDを取得
    	HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountId") == null) {
            // ログインしていない場合はエラー処理またはログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }
        Integer accountId = (Integer) session.getAttribute("accountId");

        // ギフト先情報を取得する
        List<Gift> gifts = giftRegisterDAO.getGiftsByAccountId(accountId);

        // ギフト先情報をリクエスト属性に設定する
        request.setAttribute("gifts", gifts);

        // JSP にフォワードする
        request.getRequestDispatcher("/gift-list.jsp").forward(request, response);
    }
}