package skyplus.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import entity.Booking;
import entity.Room;
import entity.Users;
import skyplus.config.Config;

public class ServiceLogin {
	public static Users GetInFormationofLogin(String username, String password) {

		try {
			String data = BasicService
					.getData(Config.URLADDRESS + "/user/login?email=" + username + "&password=" + password);
			JSONObject jsonObject1 = new JSONObject(data);
			Users user = new Users();
			String email = jsonObject1.getString("email");
			String fullname = jsonObject1.getString("fullname");
			String id = jsonObject1.getString("id");
			String pass = jsonObject1.getString("password");
			String phone = jsonObject1.getString("phone");
			String point = jsonObject1.getString("point");
			user.setId(Integer.parseInt(id));
			user.setPassword(pass);
			user.setEmail(email);
			user.setFullname(fullname);
			user.setPhone(phone);
			user.setPoint(Integer.parseInt(point));
			List<Booking> bookings = new ArrayList<>();
			try {
				JSONArray jsonBooking = jsonObject1.getJSONArray("booking");
				for (int i = 0; i < jsonBooking.length(); i++) {
					JSONObject jsonObject = jsonBooking.getJSONObject(i);
					Booking booking = new Booking();
                    booking.setId(jsonObject.getString("id"));
                    booking.setDatein(jsonObject.getString("datein"));
                    booking.setDetail(jsonObject.getString("detail"));
                    booking.setQuanlity(jsonObject.getString("quanlity"));
                    booking.setDateout(jsonObject.getString("dateout"));
                    Room room = new Room();
                    JSONObject roomjson = jsonObject.getJSONObject("room");
                    room.setId(roomjson.getInt("id"));
                    room.setDetail(roomjson.getString("detail"));
                    room.setType(roomjson.getString("type"));
                    booking.setRoom(room);
					bookings.add(booking);
				}
				user.setBookings(bookings);
				return user;

			} catch (JSONException e) {
				JSONObject jsonObject = jsonObject1.getJSONObject("booking");
				Booking booking = new Booking();
                booking.setId(jsonObject.getString("id"));
                booking.setDatein(jsonObject.getString("datein"));
                booking.setDetail(jsonObject.getString("detail"));
                booking.setQuanlity(jsonObject.getString("quanlity"));
                booking.setDateout(jsonObject.getString("dateout"));
				bookings.add(booking);
				return user;
			}
			finally {
				return user;
			}
			}
		catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
			return null;
		}

	}
}
