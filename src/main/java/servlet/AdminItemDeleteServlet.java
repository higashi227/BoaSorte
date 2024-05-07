package servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminItemDeleteServlet")
public class AdminItemDeleteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            ItemDAO.deleteItem(id);
            response.sendRedirect("adminitemsuccess.jsp"); // 成功した場合はsuccess.jspにリダイレクトします
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // 失敗した場合はerror.jspにリダイレクトします
        }
    }
}
