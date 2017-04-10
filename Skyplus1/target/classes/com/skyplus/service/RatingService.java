package skyplus.service;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

import entity.RatingId;
import skyplus.config.Config;

public class RatingService {
	public static String IncreaseRating(String idUser, String idHotel) {

		try {

			Client client = Client.create();
			WebResource webResource = client.resource(Config.URLADDRESS+"/rating/like");
			Gson gson = new Gson();

			RatingId ratingId = new RatingId(Integer.parseInt(idHotel),Integer.parseInt(idUser));
			String input = gson.toJson(ratingId);

			System.out.println(input);

			ClientResponse response = webResource.type("application/json").put(ClientResponse.class, input);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + response.getStatus());
			}

			System.out.println("Output from Server .... \n");
			String output = response.getEntity(String.class);
			System.out.println(output);
			JSONObject jsonObject = new JSONObject(output);
			String result = jsonObject.getString("result");
				return result;
		} catch (Exception e) {

			e.printStackTrace();
			return null;

		}
	}

	public static String DecreaseRating(String idUser, String idHotel) {
		try {

			Client client = Client.create();
			WebResource webResource = client.resource(Config.URLADDRESS+"/rating/unlike");
			Gson gson = new Gson();

			RatingId ratingId = new RatingId(Integer.parseInt(idHotel),Integer.parseInt(idUser));
			String input = gson.toJson(ratingId);

			System.out.println(input);

			ClientResponse response = webResource.type("application/json").delete(ClientResponse.class, input);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + response.getStatus());
			}

			System.out.println("Output from Server .... \n");
			String output = response.getEntity(String.class);
			System.out.println(output);
			JSONObject jsonObject = new JSONObject(output);
			String result = jsonObject.getString("result");
				return result;

		} catch (Exception e) {

			e.printStackTrace();
			return null;

		}

	}

}
