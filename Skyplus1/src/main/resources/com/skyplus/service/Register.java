package skyplus.service;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

import entity.Users;
import skyplus.config.Config;

public class Register {

	public static String RegisterForNewUser(String email, String password,String fullname)
	{
	Client client = Client.create();
	WebResource webResource = client.resource(Config.URLADDRESS + "/user/registry");
	Gson gson = new Gson();
	Users user = new Users();
	user.setEmail(email);
	user.setFullname(fullname);
	user.setPassword(password);
	user.setPhone("01654116641");
	user.setPoint(1);
	String input = gson.toJson(user);
	System.out.println(input);
	ClientResponse clientResponse = webResource.type("application/json").post(ClientResponse.class, input);
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
