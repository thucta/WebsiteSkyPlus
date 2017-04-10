package skyplus.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import skyplus.service.SendMailService;

/**
 * Servlet implementation class SendMail
 */
@WebServlet("/SendMail")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String username = request.getParameter("name");
		String message = request.getParameter("message");
		Thread sm = new SendMailService(email,"Chào mừng bạn đến với Skyplus",username,"Cảm ơn bạn đã quan tâm đến trang web của chúng tôi, chúng tôi sẽ trả lời sớm nhất có thể");
		sm.start();
		Thread smad = new SendMailService("nguyentinh0410@gmail.com","chúc mừng bạn đã có người quan tâm!","T là admin ok baby","bạn +"+username+"với email là:"+email+" đã gửi thư tình tới cho bạn với nội dung như sau: /n/n/n "+message);
		smad.start();	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
