package skyplus.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.AuthTokenInfo;
import entity.DetailInfor;
import entity.Information;
import entity.Users;
import entity.bookingRoom;
import skyplus.service.BookingRoomService;
import skyplus.service.GetTokenString;
import skyplus.service.ServiceLogin;

/**
 * Servlet implementation class BookRoom
 */
@WebServlet("/BookRoom")
public class BookRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookRoom() {
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

		String username = (String) request.getSession().getAttribute("login");
		String password = (String) request.getSession().getAttribute("password");
		if (username != null ||password!=null) {
			AuthTokenInfo authTokenInfo = GetTokenString.sendTokenRequest(username, password);
			String datein = request.getParameter("dateintemp");
			String dateout = request.getParameter("dateouttemp");
			System.out.println(datein + "_" + dateout);
			Information information = ((DetailInfor) request.getSession().getAttribute("MainInformation")).getInformation();
			Users users = ServiceLogin.GetInFormationofLogin(username, password);
			Integer idusers = users.getId();
			Integer idInfor = Integer.parseInt(information.getId());
			Integer numberoftype = information.getRooms().size();
			String result = "";
			for (int i = 0; i < numberoftype; i++) {
				System.out.println("select"+i);
				Integer quanlity = Integer.parseInt(request.getParameter("select"+i));
				if(quanlity==0)
				{
					continue;
				}
				Integer idroom = Integer.parseInt(request.getParameter(String.valueOf(i)));
				bookingRoom bookingService = new bookingRoom();
				System.out.println(format(datein));
				bookingService.setDatein(format(datein));
				bookingService.setDateout(format(dateout));
				bookingService.setQuanlity(quanlity);
				bookingService.setRoom(idroom);
				bookingService.setUsers(idusers);
				result = BookingRoomService.booking(bookingService, idInfor, authTokenInfo);
			}
			request.setAttribute("result", result);
			request.getRequestDispatcher("./BookingRoom.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("Login.jsp");
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

	private String format(String formart) {
		String string = formart;
		String[] parts = string.split("-");
		String part1 = parts[0];
		String part2 = parts[1];
		String part3 = parts[2];
		formart = part3 + "-" + part2 + "-" + part1;
		return formart;
	}

}
