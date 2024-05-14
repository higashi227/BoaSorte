package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    	
    	DashboardDAO dashboardDAO = new DashboardDAO();
    	
    	 System.out.println("データの取得を開始します");
    	 try {
             // サイトを知ったかの集計結果を取得
             List<Object[]> referralCounts = dashboardDAO.getReferralCounts();
             request.setAttribute("referralCounts", referralCounts);
             System.out.println("取得完了");

//             // 商品の購入回数の集計結果を取得
//             List<Object[]> purchaseCounts = dashboardDAO.getpurchaseCounts();
//             request.setAttribute("purchaseCounts", purchaseCounts);
//
//             // 商品がどの地域で購入されているかの集計結果を取得
//             List<Object[]> regionCounts = dashboardDAO.getregionCounts();
//             request.setAttribute("regionCounts", regionCounts);
//             
             

             // ダッシュボードのJSPにフォワード
             request.getRequestDispatcher("/adminmanagement.jsp").forward(request, response);
             System.out.println("データの取得が完了しました");
             
         } catch (SQLException e) {
             e.printStackTrace();
             // エラーハンドリング
             response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
         }
     }
 }
