package skyplus.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.District;
import skyplus.service.GetDistrictFollowCity;

/**
 * Servlet implementation class GetDistrictforCity
 */
@WebServlet("/GetDistrictforCity")
public class GetDistrictforCity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetDistrictforCity() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id_tinh");
		List<District> districts = GetDistrictFollowCity.GetAllDistrictFollowCity(id);
		response.getWriter().write("<select  class='form-control' name='districtselction' id='districtselction'><option value='0'>Chọn huyện</option>");
		for(int i = 0;i< districts.size();i++)
		{
			response.getWriter().write("<option value='"+ districts.get(i).getTitle()+"'>"+districts.get(i).getTitle()+"</option>");
		}
		response.getWriter().write("</select>");
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
