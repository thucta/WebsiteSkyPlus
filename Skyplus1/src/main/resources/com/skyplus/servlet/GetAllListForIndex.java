package skyplus.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.InforRating;
import skyplus.service.GetPartnerFollowRating;

/**
 * Servlet implementation class GetAllListForIndex
 */
@WebServlet("/GetAllListForIndex")
public class GetAllListForIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllListForIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<InforRating> infors = GetPartnerFollowRating.GetListInForPartnerandRating("1");
		List<InforRating> infors2 = GetPartnerFollowRating.GetListInForPartnerandRating("2");
		int number=0;
		List<InforRating>temp = new ArrayList<>();
		if(infors.size()<7)
		{
			number= infors.size();
		}
		else
		{
			number = 6;
		}
		
		for(int i = 0;i<number;i++)
		{
			temp.add(infors.get(i));
		}
		if(infors2.size()<7)
		{
			number= infors2.size();
		}
		else
		{
			number = 6;
		}
		
		for(int i = 0;i<number;i++)
		{
			temp.add(infors2.get(i));
		}
		
		request.setAttribute("TopRating", temp);
		request .getRequestDispatcher("./index.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
