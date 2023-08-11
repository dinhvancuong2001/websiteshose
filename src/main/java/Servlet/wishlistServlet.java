package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.productDao;
import Dao.wishlistDao;
import Model.Product;
import Model.User;
import Model.Wishlist;

/**
 * Servlet implementation class wishlistServlet
 */
@WebServlet("/wishlistServlet")
public class wishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wishlistServlet() {
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
		 String referer = request.getHeader("Referer"); 
		
		
		 
		wishlistDao wishlistDao = new wishlistDao();
		
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		String idproductString = request.getParameter("idproduct");
		
		int id = -1;
		if(idproductString != null) {
			id = Integer.parseInt(idproductString);
		}
		
		
		Wishlist wishlist = wishlistDao.checkWishlist(new Wishlist(id, user.getId()));
		if(wishlist == null) {
			if(user != null) {
				wishlistDao.addWishlist(new Wishlist(id, user.getId()));
				 response.getWriter().write("success");
			}
		}else {
			response.getWriter().write("exist");
		}
		
		 int c =0;
         
         if(user != null){
       	  c= wishlistDao.countWishlist(user.getId());
         }
        
		response.setHeader("X-Wishlist-Count", Integer.toString(c)); // Trong đó 'c' là số lượng sản phẩm yêu thích mới
		
		//request.getRequestDispatcher(referer).forward(request, response);
	}

}
