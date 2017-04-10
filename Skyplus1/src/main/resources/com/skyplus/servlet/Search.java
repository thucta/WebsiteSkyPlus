package skyplus.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
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
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String partner = request.getParameter("partner");
		String search = request.getParameter("search");
		byte[] bytes = search.getBytes(StandardCharsets.ISO_8859_1);
		search = new String(bytes, StandardCharsets.UTF_8);
		List<City> cities = GetAllCity.GetCities();
		request.setAttribute("cities", cities);
		List<InforRating> informations = null;
		List<String>type = GetTypeForRestaturant.GetType();
		if(search!=null)
		{
			informations = GetListInforSearch.GetListInforfollowPartner(search,partner);
			request.setAttribute("search",informations);
		
		}
		if (informations==null) {
			request.setAttribute("Message", "findnull");
		}
		if("1".equals(partner))
		{

		request.getRequestDispatcher("./SearchHotel.jsp").forward(request, response);
		}
		else
		{
			
			request.setAttribute("type", type);
		request.getRequestDispatcher("./SearchRestaurant.jsp").forward(request, response);
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
