package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.userDao;
import Model.User;


/**
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		userDao userDao = new userDao();
		
		String idString = request.getParameter("iduser");
		int id = -1;
		if(idString != null ) {
			id = Integer.parseInt(idString);
		}
		
		User user = userDao.getUserById(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("EditUser.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String idString = request.getParameter("idedit");
		String username = request.getParameter("username");	
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int role = Integer.parseInt(request.getParameter("role"));
		
		String Oemail = request.getParameter("Oemail");
		
		int id = -1;
		if(idString != null) {
			id = Integer.parseInt(idString);
		}
		
		User user = new User(id,username,email,password,role);
		
		userDao userDao = new userDao();
		User user3 = userDao.getUserById(id);
		
		
		List<User> users = userDao.getListUsers();
		int cnt1 =0;
		for (User user2 : users) {
			if(user2.getEmail().equalsIgnoreCase(email)) {
				cnt1++;
			}
			
		}
		
		if(cnt1 > 0 && !email.equals(Oemail)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("editEmail", "Email bị trùng, Vui lòng nhập email khác");
			
		}else {
			userDao.updateInfor(user);
			
		}
		
		
		response.sendRedirect("/shopshoe/admin/manageuser.jsp");
		
		
		
		
	}

}
