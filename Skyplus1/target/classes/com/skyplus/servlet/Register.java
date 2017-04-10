package skyplus.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		byte[] bytes = firstName.getBytes(StandardCharsets.ISO_8859_1);
		firstName = new String(bytes, StandardCharsets.UTF_8);
		String lastName = request.getParameter("lastName");
		 bytes = lastName.getBytes(StandardCharsets.ISO_8859_1);
		lastName = new String(bytes, StandardCharsets.UTF_8);
		try {
			String fullname = firstName+" "+lastName;
			String result = skyplus.service.Register.RegisterForNewUser(email, password, fullname);
			if("true".equals(result)){
				request.getSession().setAttribute("email", email);	
				request.getSession().setAttribute("password", password);	
				request.getRequestDispatcher("./index.jsp").forward(request, response);
			}else{
				request.setAttribute("err", "Tạo tài khoản không thành công!!!");
				request.getRequestDispatcher("./Login.jsp").forward(request, response);
			}
			
		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
