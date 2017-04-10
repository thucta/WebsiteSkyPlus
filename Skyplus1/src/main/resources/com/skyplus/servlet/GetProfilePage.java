package skyplus.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Users;
import skyplus.service.GetInforFollowRoom;
import skyplus.service.ServiceLogin;

/**
 * Servlet implementation class GetProfilePage
 */
@WebServlet("/GetProfilePage")
public class GetProfilePage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetProfilePage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user = (String) request.getSession().getAttribute("login");
		String pass = (String) request.getSession().getAttribute("password");
		if(user!=null)
		{
		Users users = ServiceLogin.GetInFormationofLogin(user, pass);
		if(users!=null)
		{
		for (int i = 0; i < users.getBookings().size(); i++) {
			users.getBookings().get(i).getRoom()
					.setInformation(GetInforFollowRoom.GetInfors(users.getBookings().get(i).getRoom().getId()));
		}
		System.out.println(users.getFullname());
		}
		request.setAttribute("user", users);
		request.getRequestDispatcher("./ProfileUser.jsp").forward(request, response);
		}
		
		else
		{
		request.getRequestDispatcher("./Login").forward(request, response);
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
