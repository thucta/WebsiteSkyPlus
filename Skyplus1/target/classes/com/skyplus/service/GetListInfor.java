package skyplus.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import entity.Information;
import skyplus.config.Config;

public class GetListInfor {

	public static List<Information> GetListInforfollowPartner(String idpartner) {

		try {
			String data = BasicService.getData(Config.URLADDRESS+ "/infor/listinfor?partner="+idpartner);
			System.out.println(Config.URLADDRESS+ "/infor/listinfor?partner="+idpartner);
	
			JSONObject jsonObject1= new JSONObject(data);
			JSONArray jsonArray = jsonObject1.getJSONArray("information");
			List<Information> informations = new ArrayList<>();
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				Information information = new Information();
				String iD = String.valueOf(jsonObject.get("id"));
				String hotline = String.valueOf(jsonObject.get("hotline"));
				String name = String.valueOf(jsonObject.get("name"));
				String timeopen = String.valueOf(jsonObject.get("timeopen"));
				information.setHotline(hotline);
				information.setId(iD);
				information.setName(name);
				System.out.println(name);
				information.setTimeopen(timeopen);
				informations.add(information);

			}
			return informations;
		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
			return null;
		}

	}

}
