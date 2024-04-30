package servlet;

import java.io.IOException;

import dao.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
                response.sendRedirect("main.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
