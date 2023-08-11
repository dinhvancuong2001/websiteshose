package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.productDao;
import Dao.reviewDao;

import Model.Product;
import Model.Review;

/**
 * Servlet implementation class inforDatailServlet
 */
@WebServlet("/inforDatailServlet")
public class inforDatailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inforDatailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		productDao productDao = new productDao();
		
		
		String idString = request.getParameter("id");
		int id =-1;
		if(idString != null) {
			id = Integer.parseInt(idString);
		}
		
		Product product = productDao.getProductById(id);
		String category = "";
		
		
		// sản phẩm liên quan
		List<Product> productRelate = new ArrayList<>();
		if(product != null) {
			category = productDao.getNameCategory(product.getCategory_id());
			 productRelate = productDao.getListProductByCategory(product.getCategory_id(),id);
		}
	// kết thúc
		
		
		
        request.setAttribute("product", product);
        request.setAttribute("category", category);
        request.setAttribute("productRelate", productRelate);
        
		
		
		
        reviewDao reviewDao = new reviewDao();
        List<Review> reviews = reviewDao.getListReviews(id);
        
		int numberProduct = 9; // số sản phầm được hiện lên trang;
		int page; // số trang hiện tại
		int size = reviews.size();
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
		List<Review> list = reviewDao.getReviewByPage(reviews, start, end);
		
		
		
		request.setAttribute("reviews", list);
		request.setAttribute("page", page);
		request.setAttribute("numberPage",numberPage);
		
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
