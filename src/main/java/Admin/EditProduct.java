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
import Model.Product;


/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idString = request.getParameter("id");
		int id =-1;
		if (idString != null) {
			id = Integer.parseInt(idString);
		}
		
		productDao productDao = new productDao();
		Product product = productDao.getProductById(id);
		int category_id = productDao.getCategoryProduct(id);
		
		Category category = productDao.getCategoryById(category_id);
		List<Category> notCategory = productDao.getListCategorysByAdmin(category_id);
	
		HttpSession session = request.getSession();
		session.setAttribute("product", product);
		session.setAttribute("category", category);
		session.setAttribute("notcategory", notCategory);
		response.sendRedirect("/shopshoe/admin/editproduct.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		int id =Integer.parseInt(request.getParameter("id"));
		String  name = request.getParameter("name");
		String  shortdes = request.getParameter("short_description");
		Double gia = Double.parseDouble(request.getParameter("price"));
		Double discount = Double.parseDouble(request.getParameter("discount"));
		int soluong = Integer.parseInt(request.getParameter("quantity"));
		
		int maloai = Integer.parseInt(request.getParameter("category_id"));
		String anh = request.getParameter("thumbnail");
		String thongtin =request.getParameter("description");
	
		
		Product product = new Product(id, name, shortdes, gia, discount, soluong, anh, thongtin,maloai);
		
		productDao productDao = new productDao();
		
		productDao.editsanpham(product);
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("product");
		session.removeAttribute("category");
		session.removeAttribute("notcategory");
		response.sendRedirect("/shopshoe/admin/manageproduct.jsp");
		
	}

}
