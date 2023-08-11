package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.wishlistDao;
import Model.User;

/**
 * Servlet implementation class removeProductWish
 */
@WebServlet("/removeProductWish")
public class removeProductWish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeProductWish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		wishlistDao wishlistDao = new wishlistDao();
		
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		String idproductString = request.getParameter("idproductremove");
		
		int id = -1;
		if(idproductString != null) {
			id = Integer.parseInt(idproductString);
		}
		
		if(user != null) {
			wishlistDao.removeWishlist(id, user.getId());
		}
		response.sendRedirect("wishlist.jsp");
	}

}
