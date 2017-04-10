package skyplus.service;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

import entity.AuthTokenInfo;
import entity.bookingRoom;
import skyplus.config.Config;

public class BookingRoomService {

	public static String booking(bookingRoom bookingRoom,Integer idInfor,AuthTokenInfo authTokenInfo) {

		Client client = Client.create();
		WebResource webResource = client.resource(Config.URLADDRESS + "/room/bookroom" + Config.QPM_ACCESS_TOKEN + authTokenInfo.getAccess_token());
		System.out.println(Config.URLADDRESS + "/room/bookroom" + Config.QPM_ACCESS_TOKEN + authTokenInfo.getAccess_token());
		Gson gson = new Gson();		
		String input = gson.toJson(bookingRoom);
		System.out.println(input);

		ClientResponse response = webResource.type("application/json").post(ClientResponse.class, input);

		if (response.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + response.getStatus());
		}
		System.out.println("Output from Server .... \n");
		String output = response.getEntity(String.class);
		System.out.println(output);
		System.out.println(output);
		JSONObject jsonObject = new JSONObject(output);
		String result = jsonObject.getString("result");

		return result;

	}

}
