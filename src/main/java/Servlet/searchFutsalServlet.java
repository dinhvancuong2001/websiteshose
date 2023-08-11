package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.ConnectionUtil;
import Dao.productDao;
import Model.Product;

/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/searchFutsalServlet")
public class searchFutsalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		productDao productDao = new productDao();
	    String[] checkboxValues = request.getParameterValues("checkboxSearch");
	   
	    
	  String str = String.join("", checkboxValues);
	    if(str.contains(",")) {
	    	
	    	String[] split = str.split(",");
	    	checkboxValues = split;
	    	for (String string : checkboxValues) {
				System.out.println(string);
			}
	    }
	    
	    
	    String pricemin = request.getParameter("pricemin");
	    String pricemax = request.getParameter("pricemax");
        
	    String minString = pricemin;
	    String maxString = pricemax;
	     pricemin = pricemin.replace(".", "") + "0000";
	     pricemax = pricemax.replace(".", "") + "0000";
	    List<Product> products = productDao.getListProductsSort(checkboxValues,pricemin,pricemax);
	   
	    
	    

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
	    
	    
	    
		
		 String checkboxSearchString = "";
		    if (checkboxValues != null) {
		        checkboxSearchString = String.join(",", checkboxValues);
		        
		    }
		int id = 1;
		request.setAttribute("products", list);
		request.setAttribute("page", page);
		request.setAttribute("numberPage",numberPage);
		request.setAttribute("tag", id); // đánh dấu hiển thị sản phẩm không theo danh mục
		request.setAttribute("pricemin",minString);
		request.setAttribute("pricemax", maxString);
		request.setAttribute("checkbox", checkboxSearchString);
		request.getRequestDispatcher("ShoeFutsal.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		productDao productDao = new productDao();
	    String[] checkboxValues = request.getParameterValues("checkboxSearch");
	    String checkboxSearchString = "";

	    if (checkboxValues != null) {
	        checkboxSearchString = String.join(",", checkboxValues);
	    }
	    
	    
	    String pricemin = request.getParameter("pricemin");
	    String pricemax = request.getParameter("pricemax");
        
	    String minString = pricemin;
	    String maxString = pricemax;
	     pricemin = pricemin.replace(".", "") + "0000";
	     pricemax = pricemax.replace(".", "") + "0000";
	    List<Product> products = productDao.getListProductsSort(checkboxValues,pricemin,pricemax);
	   
	    
	    

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
	    
	    
	    
		int id = 1;
		request.setAttribute("products", list);
		request.setAttribute("page", page);
		request.setAttribute("numberPage",numberPage);
		request.setAttribute("tag", id); // đánh dấu hiển thị sản phẩm không theo danh mục
		request.setAttribute("pricemin",minString);
		request.setAttribute("pricemax", maxString);
		request.setAttribute("checkbox", checkboxSearchString);
		request.getRequestDispatcher("ShoeFutsal.jsp").forward(request, response);
	}


}
