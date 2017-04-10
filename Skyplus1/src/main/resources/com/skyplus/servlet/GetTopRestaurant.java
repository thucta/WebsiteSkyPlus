package skyplus.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.City;
import entity.InforRating;
import skyplus.service.GetAllCity;
import skyplus.service.GetPartnerFollowRating;
import skyplus.service.GetTypeForRestaturant;

/**
 * Servlet implementation class GetTopRestaurant
 */
@WebServlet("/GetTopRestaurant")
public class GetTopRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTopRestaurant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		List<InforRating> information = GetPartnerFollowRating.GetListInForPartnerandRating("2");
		List<City> cities = GetAllCity.GetCities();
		List<InforRating>infors  = new ArrayList<>();
		List<String>type = GetTypeForRestaturant.GetType();
		int t = 0;
		if( information.size()<6)
		{
			t = information.size();
		}
		else
		{
			t=6;
		}
		for( int i = 0; i<t;i++)
		{
			infors.add(information.get(i));
		}
		request.setAttribute("type", type);
		request.setAttribute("cities", cities);
		request.setAttribute("TopRestaurant", infors);
		request.getRequestDispatcher("./SearchRestaurant.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
