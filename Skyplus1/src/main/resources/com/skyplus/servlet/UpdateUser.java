package skyplus.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Users;
import skyplus.service.ServiceLogin;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/Updateuser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = (String) request.getSession().getAttribute("login");
		
		String password1 = (String)request.getSession().getAttribute("password");
		String password = request.getParameter("password");
		String fullname = request.getParameter("name");
		byte[] bytes = fullname.getBytes(StandardCharsets.ISO_8859_1);
		fullname = new String(bytes, StandardCharsets.UTF_8);
		String phone = request.getParameter("phone");
		Users users = ServiceLogin.GetInFormationofLogin(email, password1);
		String result = skyplus.service.UpdateUser.UpdateOldUser(users, password, fullname,phone);
		if("true".equals(result))
		{
			request.setAttribute("Message", "thanhcong");
			request.getSession().setAttribute("password", password);
		}
		else
		{
			request.setAttribute("Message", "thatbai");
		}
		request.getRequestDispatcher("./ProfileUser.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
