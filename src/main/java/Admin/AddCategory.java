package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.productDao;
import Model.Category;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
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
		
		productDao productDao = new productDao();
		
		
		String name = request.getParameter("namecategory");
		String shoetypeString = request.getParameter("shoetype");
		
		int shoetype = Integer.parseInt(shoetypeString);
		
		
			if (productDao.getCategoryByNameAndShoe(name, shoetype) != null) {
			
				HttpSession session = request.getSession();
				session.setAttribute("failcategory", "Danh mục đã tồn tại. Vui lòng thêm danh mục khác");
				
			}else {
				productDao.addCategory(name,shoetype);
			}
			response.sendRedirect("/shopshoe/admin/managecategory.jsp");
		
		
		
	}

}
