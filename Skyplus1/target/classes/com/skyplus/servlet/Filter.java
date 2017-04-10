package skyplus.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
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
import skyplus.service.GetInforFollowDistrict;

/**
 * Servlet implementation class Filter
 */
@WebServlet("/Filter")
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Filter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String partner = request.getParameter("partner");
		System.out.println(partner);
		String city = request.getParameter("city");
		System.out.println(city);
		List<City> cities = GetAllCity.GetCities();
		for(int i = 0;i<cities.size();i++)
		{
			if(city.equals(cities.get(i).getID()))
			{
				city = cities.get(i).getTitle();
			}
		}
		String district = request.getParameter("districtselction");
		System.out.println(district);
		List<InforRating> informations = new ArrayList<>();
		if(!district.equals("0"))
		{
			
			byte[] bytes = district.getBytes(StandardCharsets.ISO_8859_1);
			district = new String(bytes, StandardCharsets.UTF_8);
			informations = GetInforFollowDistrict.GetListInforsfollowDistrict(district, partner,city);
			request.setAttribute("search",informations);
			
		}
		else
		{
			informations = GetInforFollowDistrict.GetListInforsfollowProvince(partner,city);
			request.setAttribute("search",informations);
		}
		if("1".equals(partner))
		{
		request.getRequestDispatcher("./SearchHotel.jsp").forward(request, response);
		return;
		}
		else
		{
		request.getRequestDispatcher("./SearchRestaurant.jsp").forward(request, response);
		return;
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
