package skyplus.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import skyplus.config.Config;

public class GetTypeForRestaturant {

	public static List<String> typestactic;

	public static List<String> GetType() {
		List<String> lsttype = new ArrayList<>();
		String data = BasicService.getData(Config.URLADDRESS + "/infor/type");
		try {
			JSONObject jsonObject = new JSONObject(data);
			try {
				JSONArray types = jsonObject.getJSONArray("type");
				for (int i = 0; i < types.length(); i++) {
					JSONObject rec = types.getJSONObject(i);
				String type = rec.getString("result");
				lsttype.add(type);
				}
				typestactic= lsttype;
				return lsttype;
			} catch (JSONException e) {
				JSONObject rec = jsonObject.getJSONObject("type");
				String type = rec.getString("result");
				lsttype.add(type);
				typestactic = lsttype;
				return lsttype;
			}
		} catch (Exception e) {
			return null;
		}
	}

}
