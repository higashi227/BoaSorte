package servlet;

import java.io.IOException;

import dao.LoginDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Login;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mailAddress = request.getParameter("mailAddress");
        String password = request.getParameter("password");

        Login login = new Login(mailAddress, password);

        LoginDAO loginDAO = new LoginDAO();

        try {
            if (loginDAO.validate(login)) {
                // ログイン成功時の処理
                // セッションにユーザー情報を保存する
                HttpSession session = request.getSession();
                session.setAttribute("user", mailAddress); // メールアドレスをセッションに保存する

                // ログイン成功時にはマイページにリダイレクト
                response.sendRedirect("my-page");
            } else {
                // ログイン失敗時にはエラーメッセージをリクエストスコープに保存してログインページにフォワード
                request.setAttribute("errorMessage", "Invalid email or password");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}