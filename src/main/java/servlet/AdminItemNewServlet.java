package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/AdminItemNewServlet")	
	public class AdminItemNewServlet extends HttpServlet {
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 
		 //adminitemedit.jspにフォワード
	        RequestDispatcher dispatcher = request.getRequestDispatcher("adminitemnew.jsp");
	        dispatcher.forward(request, response);
	    }
}

	 