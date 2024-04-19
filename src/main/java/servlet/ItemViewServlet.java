package servlet;

import java.io.IOException;
import java.util.List;

import dao.ItemDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

@WebServlet("/ItemView")
public class ItemViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		// データベースから備品情報を取得
		ItemDAO itemDAO = new ItemDAO();
		List<Item>items = ItemDAO.getAllItem();
		

		//取得した備品情報をリクエスト属性にセット
		request.setAttribute("items", items);

		// equipment.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminmanagement.jsp");
		dispatcher.forward(request, response);
	}



	}




