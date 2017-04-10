package skyplus.service;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import entity.District;
import skyplus.config.Config;

public class GetDistrictFollowCity {

	public static List<District> GetAllDistrictFollowCity(String idCity) {
		try {
			String data = BasicService.getData(Config.URLSERVICECITY+"/"+idCity+"/district");
			JSONArray jsonArray = new JSONArray(data);
			List<District> districts = new ArrayList<>();
			for (int i = 0; i < jsonArray.length(); ++i) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				District district = new District();
				String iD = String.valueOf(jsonObject.get("ID"));
				String solrID = jsonObject.getString("SolrID");
				String title = jsonObject.getString("Title");
				district.setID(iD);
				district.setSolrdID(solrID);
				district.setTitle(title);
				districts.add(district);

			}
			return districts;
		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
			return null;
		}
	}

}
