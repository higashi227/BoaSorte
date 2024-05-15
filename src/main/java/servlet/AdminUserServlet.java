package servlet;

import java.io.IOException;
import java.util.List;

import dao.AdminDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 全ユーザー情報を取得
        List<Account> userList = AdminDAO.getAllUsers();

        // ユーザー情報をリクエスト属性に設定
        request.setAttribute("userList", userList);

        // JSPにフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminuser.jsp");
        dispatcher.forward(request, response);
    }
	
}
