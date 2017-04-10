package skyplus.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetRoomActive
 */
@WebServlet("/GetRoomActive")
public class GetRoomActive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRoomActive() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hotelname =  request.getParameter("name");
		String dateIn = request.getParameter("datein");
		String dateOut = request.getParameter("dateout");
		System.out.println(dateIn+" / "+dateOut+" / "+" / "+hotelname);
		dateIn = format(dateIn);
		dateOut=format(dateOut);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
