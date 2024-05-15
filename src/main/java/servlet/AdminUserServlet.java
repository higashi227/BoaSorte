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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	
        String name = request.getParameter("name");
        
        List<Account> userList = AdminDAO.findUserByColumn("name", name);
        if (userList != null && !userList.isEmpty()) {
            for (Account user : userList) {
                int accountId = user.getAccountId();
                String mailAddress = user.getMailAddress();
                String password = user.getPassword(); // パスワードの取得はセキュリティ上の理由から避けることが推奨されます
                String userName = user.getName();
                String postnum = user.getPostnum();
                String address = user.getAddress();
                String birthday = user.getBirthday();
                String telephone = user.getTelephone();
                // 必要に応じて他の情報も取得

                // 取得した情報をリクエスト属性に設定
                request.setAttribute("accountId", accountId);
                request.setAttribute("mailAddress", mailAddress);
                request.setAttribute("password", password);
                request.setAttribute("userName", userName);
                request.setAttribute("postnum", postnum);
                request.setAttribute("address", address);
                request.setAttribute("birthday", birthday);
                request.setAttribute("telephone", telephone);
                // 他の情報もリクエスト属性に設定
            }
        }

        // 検索結果をリクエスト属性に設定
        request.setAttribute("userList", userList);

        // JSPを表示
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminuser.jsp");
        dispatcher.forward(request, response);
    }
}
