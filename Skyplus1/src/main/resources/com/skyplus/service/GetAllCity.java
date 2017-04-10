package skyplus.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import entity.City;
import skyplus.config.Config;

public class GetAllCity {

	public static List<City> GetCities() {
		try {
			String input = BasicService.getData(Config.URLSERVICECITY);
			List<City> cities = new ArrayList<>();
			JSONObject data = new JSONObject(input);
			JSONArray jsonArray = data.getJSONArray("LtsItem");
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				City city = new City();
				String iD = String.valueOf(jsonObject.get("ID"));
				String solrID = jsonObject.getString("SolrID");
				String title = jsonObject.getString("Title");
				city.setID(iD);
				city.setSolrID(solrID);
				city.setTitle(title);
				cities.add(city);

			}
			return cities;
		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
			return null;
		}
	}
}
