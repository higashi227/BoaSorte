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
    
    	
    	 try {
             // サイトを知ったかの集計結果を取得
             List<Object[]> referralCounts = DashboardDAO.getReferralCounts();
             request.setAttribute("referralCounts", referralCounts);

             // 商品の購入回数の集計結果を取得
             List<Object[]> purchaseCounts = DashboardDAO.getpurchaseCounts();
             request.setAttribute("purchaseCounts", purchaseCounts);

             // 商品がどの地域で購入されているかの集計結果を取得
             List<Object[]> regionCounts = DashboardDAO.getregionCounts();
             request.setAttribute("regionCounts", regionCounts);
             
             

             // ダッシュボードのJSPにフォワード
             request.getRequestDispatcher("/adminmanagement.jsp").forward(request, response);
             System.out.println("送信完了");
         } catch (SQLException e) {
             e.printStackTrace();
             // エラーハンドリング
             response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
         }
     }
 }
//    	try {
//    	            // サイトを知ったかの集計結果を取得
//    	            Map<String, Integer> referralCounts = DashboardDAO.getReferralCounts();
//    	            request.setAttribute("referralCounts", referralCounts);

    	            // 商品の購入回数の集計結果を取得
//    	            Map<String, Map<Long, Integer>> purchaseCounts = DashboardDAO.getpurchaseCounts();
//    	            request.setAttribute("purchaseCounts", purchaseCounts);
//
//    	            // 商品がどの地域で購入されているかの集計結果を取得
//    	            Map<String, Map<Long, Integer>> regionCounts = DashboardDAO.getregionCounts();
//    	            request.setAttribute("regionCounts", regionCounts);
//    	            
    	       

//    	            // ダッシュボードのJSPにフォワード
//    	           request.getRequestDispatcher("/adminmanagement.jsp").forward(request, response);
//    	           System.out.println("送信完了");
//    	        } catch (SQLException e) {
//    	            e.printStackTrace();
//    	            // エラーハンドリング
//    	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//    	        }
//    	}
//    }
	
