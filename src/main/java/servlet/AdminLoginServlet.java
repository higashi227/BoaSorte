package servlet;

import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Login;

@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mailAddress = request.getParameter("mailAddress");
        String password = request.getParameter("password");

        Login login = new Login(mailAddress, password);

        try {
            if (AdminDAO.validate(login)) {
                // ログイン成功したら商品一覧ページにリダイレクト
                response.sendRedirect("ItemListServlet");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
