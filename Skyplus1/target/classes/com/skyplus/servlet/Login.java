package skyplus.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import skyplus.config.Config;
import skyplus.service.BasicService;
import skyplus.service.CheckEmailService;
import skyplus.service.Register;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String result="";
		if(!password.equals("gg"))
		{
		String url = Config.URLADDRESS+"/user/login?email="+username+"&password="+password;
		System.out.println(url);
		result = BasicService.getData(url);
		}
		else
		{
			String checkmail = CheckEmailService.checkEmail(username);
			System.out.println("aaa");
			if(checkmail.equals("true"))
			{
				String fullname = request.getParameter("fullname");
				String temp =Register.RegisterForNewUser(username, password, fullname);
				if("true".equals(temp)){
					request.getSession().setAttribute("email", username);	
					request.getSession().setAttribute("password", password);	
					request.getRequestDispatcher("./index.jsp").forward(request, response);
				}
			}
		}
		if(result!=null)
		{
		request.getSession().setAttribute("login", username);
		request.getSession().setAttribute("password", password);
		response.sendRedirect("./index.jsp");
		}
		else
		{
			request.setAttribute("Error", "Sai tên đăng nhập hoặc password");
			request.getRequestDispatcher("./Login.jsp").forward(request, response);
		}		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
