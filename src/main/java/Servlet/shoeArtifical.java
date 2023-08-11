package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Product;
import Dao.*;
/**
 * Servlet implementation class storeServlet
 */
@WebServlet("/shoeArtifical")
public class shoeArtifical extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		productDao productDao = new productDao();
        List<Product> products = productDao.getListProductsArtifical();
		
		int numberProduct = 9; // số sản phầm được hiện lên trang;
		int page; // số trang hiện tại
		int size = products.size();
		int numberPage = (size%numberProduct == 0 ? (size/numberProduct):((size/numberProduct)+1));
		String xpage = request.getParameter("page"); // lấy số trâng được bấm về;
		if(xpage == null) {
			page =1;
		}
		else {
			page = Integer.parseInt(xpage);
		}
		int start,end;
		start = (page -1)* numberProduct;
		end = Math.min(page*numberProduct, size);
		List<Product> list = productDao.getProductByPage(products, start, end);
		
		
		int id = 0;
		request.setAttribute("products", list);
		request.setAttribute("page", page);
		request.setAttribute("numberPage",numberPage);
		request.setAttribute("tag", id); // đánh dấu hiển thị sản phẩm không theo danh mục
		request.getRequestDispatcher("ShoeArtifical.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
