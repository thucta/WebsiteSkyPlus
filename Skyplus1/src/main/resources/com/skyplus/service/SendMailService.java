package skyplus.service;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class SendMailService extends Thread {
		private String email;
		private String userName;
		private String content;
		private String subject;
		public static final String EMAIL = "SkyPlus.withLove@gmail.com";
	    public static final String PASSWORD = "trangtruongtinhthyuyen";

		public SendMailService(String email,String subject, String userName,String message) {
			this.email = email;
			this.content = message;
			this.userName = userName;
			this. subject = subject;
		}

		@Override
		public void run() {

			System.out.println("bat dau vao gui mail");

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(EMAIL, PASSWORD);
				}
			});
			System.out.println("tao session");
			try {

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(EMAIL));

				System.out.println("email" + EMAIL + PASSWORD);

				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
				message.setSubject(subject);
				message.setText("Chào " +userName+"\n\n\n"
						+content+ "\n\n\n Mọi ý kiến đóng góp xin gửi về email: SkyPlus.withLove@gmail.com. \n\n\n Đây là thư tự động.Vui lòng không relay email này!\nThân!");

				Transport.send(message);

				System.out.println("Gui Mail thanh cong!!!");

			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		}

}
