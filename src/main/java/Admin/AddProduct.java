package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.productDao;
import Model.Product;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
		
		String  name = request.getParameter("name");
		String  shortdes = request.getParameter("short_description");
		Double gia = Double.parseDouble(request.getParameter("price"));
		Double discount = Double.parseDouble(request.getParameter("discount"));
		int soluong = Integer.parseInt(request.getParameter("quantity"));
		
		int maloai = Integer.parseInt(request.getParameter("category_id"));
		String anh = request.getParameter("thumbnail");
		String thongtin =request.getParameter("description");
	
		
		Product product = new Product( name, shortdes, gia, discount, soluong, anh, thongtin,maloai);
		
		productDao productDao = new productDao();
		
		productDao.addsanpham(product);
		
		response.sendRedirect("admin/manageproduct.jsp");
		
	}

}
