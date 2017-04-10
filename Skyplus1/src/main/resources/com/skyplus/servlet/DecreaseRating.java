package skyplus.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.DetailInfor;
import entity.InforRating;
import entity.Users;
import skyplus.service.GetFood;
import skyplus.service.GetRoom;
import skyplus.service.GetSingleInfomationClass;
import skyplus.service.RatingService;
import skyplus.service.ServiceLogin;

/**
 * Servlet implementation class DecreaseRating
 */
@WebServlet("/DecreaseRating")
public class DecreaseRating extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DecreaseRating() {
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

		request.setCharacterEncoding("UTF-8");
		String partner = request.getParameter("partner");
		String idHotel = request.getParameter("name");
		String idUser;
		String username = (String) request.getSession().getAttribute("login");
		String password = (String) request.getSession().getAttribute("password");
		if (username == null) {
			idUser = "0";
		} else {
			Users users = ServiceLogin.GetInFormationofLogin(username, password);
			idUser = String.valueOf(users.getId());

		}
		String result = RatingService.DecreaseRating(idUser, idHotel);
		if(result.equals("true"))
		{
			
		}
		else
		{
			
		}
		List<DetailInfor> information = new ArrayList<>();
		information = GetSingleInfomationClass.GetSingleInformation(idUser, partner, idHotel);
		if (partner.equals("1")) {
			information.get(0).getInformation()
					.setRooms(GetRoom.getRoom(Integer.parseInt(information.get(0).getInformation().getId())));
		} else {

			information.get(0).getInformation()
					.setFood(GetFood.getFood(Integer.parseInt(information.get(0).getInformation().getId())));
		}
		information.get(0).getInformation().setPartner(partner);
		List<InforRating> informationnear = GetInformationnear.GetInformation(partner,
				information.get(0).getInformation().getDistrict(), information.get(0).getInformation().getProvince());
		request.setAttribute("nearinformations", informationnear);
		request.getSession().setAttribute("MainInformation", information.get(0));
		request.getRequestDispatcher("./SinglePartner.jsp?partner=" + partner).forward(request, response);

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
