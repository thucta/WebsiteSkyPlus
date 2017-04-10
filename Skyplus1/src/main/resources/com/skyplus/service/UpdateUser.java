package skyplus.service;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

import entity.Users;
import skyplus.config.Config;

public class UpdateUser {
	public static String UpdateOldUser(Users user1, String password,String fullname,String phone)
	{
	Client client = Client.create();
	WebResource webResource = client.resource(Config.URLADDRESS + "/user/updatauser");
	Gson gson = new Gson();
	Users user = new Users();
	user.setEmail(user1.getEmail());
	user.setFullname(fullname);
	user.setPassword(password);
	user.setPhone(phone);
	user.setPoint(user1.getPoint());
	user.setBookings(user1.getBookings());
	user.setId(user1.getId());
	String input = gson.toJson(user);
	System.out.println(input);
	ClientResponse clientResponse = webResource.type("application/json").put(ClientResponse.class, input);
	if (clientResponse.getStatus() != 200) {
		throw new RuntimeException("Failed : HTTP error code : " + clientResponse.getStatus());
	}
	String output = clientResponse.getEntity(String.class);
	System.out.println(output);
	JSONObject jsonObject = new JSONObject(output);
	String result = jsonObject.getString("result");
		return result;
	}

}
