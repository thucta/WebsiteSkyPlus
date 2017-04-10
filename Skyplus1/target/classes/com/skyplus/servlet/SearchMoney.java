package skyplus.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.City;
import entity.InforRating;
import skyplus.service.GetAllCity;
import skyplus.service.GetListInforSearch;
import skyplus.service.GetTypeForRestaturant;

/**
 * Servlet implementation class SearchMoney
 */
@WebServlet("/SearchMoney")
public class SearchMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchMoney() {
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
		String partner = request.getParameter("partner");
		String search = request.getParameter("money");
		Integer up = 0;
		Integer down = 0;
		List<String> type = GetTypeForRestaturant.GetType();
		List<City> cities = GetAllCity.GetCities();
		List<InforRating> informations = null;
		request.setAttribute("cities", cities);
		System.out.println(search);
		switch (search) {
		case "1":
			if(partner.equals("1"))
			{
				up = 500000;
				down =0;
			}
			else
			{
				up = 50000;
				down =0;
			}
			break;
		case "2":
			if(partner.equals("1"))
			{
				up = 1000000;
				down =500000;
			}
			else
			{
				up = 100000;
				down =50000;
			}
			break;
		case "3":
			if(partner.equals("1"))
			{
				up = 1500000;
				down =1000000;
			}
			else
			{
				up = 150000;
				down =100000;
			}
			break;
		case "4":
			if(partner.equals("1"))
			{
				up = 2000000;
				down =1500000;
			}
			else
			{
				up = 200000;
				down =150000;
			}
			break;
		case "5":
			if(partner.equals("1"))
			{
				up = 10000000;
				down =2000000;
			}
			else
			{
				up = 1000000;
				down =200000;
			}
			break;
		default:
			break;
		}

		if (search != null) {
			informations = GetListInforSearch.GetListInforFollowMoney(up,down, partner);
			request.setAttribute("search", informations);

		}
		if (informations==null) {
			request.setAttribute("Message", "findnull");
		}
		if ("1".equals(partner)) {

			request.getRequestDispatcher("./SearchHotel.jsp").forward(request, response);
		} else {

			request.setAttribute("type", type);
			request.getRequestDispatcher("./SearchRestaurant.jsp").forward(request, response);
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
