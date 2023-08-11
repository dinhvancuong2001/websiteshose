package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.reviewDao;
import Model.Review;

/**
 * Servlet implementation class reviewServlet
 */
@WebServlet("/reviewServlet")
public class reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		  String referer = request.getHeader("Referer"); // Lấy URL trang trước đó
		
		String product = request.getParameter("idproductreview");
		String name = request.getParameter("namereview");
		String email = request.getParameter("emailreview");
		String content = request.getParameter("contentreview");
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		reviewDao reviewDao = new reviewDao();
		
		reviewDao.addReview(new Review(name, email, content, rating,Integer.parseInt(product)));
		
		response.sendRedirect(referer);
		
		
		
		
	}

}
