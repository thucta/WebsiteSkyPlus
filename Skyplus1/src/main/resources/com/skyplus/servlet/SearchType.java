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
 * Servlet implementation class SearchType
 */
@WebServlet("/SearchType")
public class SearchType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchType() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub\
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String partner = request.getParameter("partner");
		String number = request.getParameter("rating");
		System.out.println(number);
		String search="";
		List<String>type = GetTypeForRestaturant.GetType();
		List<City> cities = GetAllCity.GetCities();
		List<InforRating> informations = null;
		request.setAttribute("cities", cities);
		if(partner.equals("1"))
		{
		switch (number) {
		case "1":
			search = "Khách sạn 1 sao";
			break;
		case "2":
			search = "Khách sạn 2 sao";
			break;
		case "3":
			search = "Khách sạn 3 sao";
			break;
		case "4":
			search = "Khách sạn 4 sao";
			break;
		case "5":
			search = "Khách sạn 5 sao";
			break;
		}
		}
		else
		{
			search = GetTypeForRestaturant.typestactic.get(Integer.parseInt(number));
		}
		if(search!=null)
		{
			informations = GetListInforSearch.GetListInforFollowRating(search,partner);
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
