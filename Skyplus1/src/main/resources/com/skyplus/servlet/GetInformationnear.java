package skyplus.servlet;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import entity.InforRating;
import entity.Information;
import skyplus.config.Config;
import skyplus.service.BasicService;

public class GetInformationnear {

	public static List<InforRating> GetInformation(String partner, String district, String province) {
		// TODO Auto-generated method stub
		try {
			if(partner.equals("1"))
			{
				partner="2";
			}
			else
			{
				partner="1";
			}
			String data = BasicService.getData(Config.URLADDRESS + "/infor/search?partner="+partner +
					"&&district="+URLEncoder.encode(district, "UTF-8")+
					"&&province="+URLEncoder.encode(province, "UTF-8"));
			JSONObject jsonObject = new JSONObject(data);
			List<InforRating> listInfor = new ArrayList<>();
		try{	
			JSONArray listHotelJson = jsonObject.getJSONArray("InformationRating");
			
			for (int i = 0 ; i < listHotelJson.length();i++){
			JSONObject rec = listHotelJson.getJSONObject(i);
			InforRating inforRating = new InforRating();
			inforRating.setRating(rec.getLong("rating"));
			inforRating.setPrice(rec.getLong("price"));
			JSONObject inforObJect = rec.getJSONObject("infor");
			Information information = new Information();
			information.setPartner(partner);
			information.setId(inforObJect.getString("id"));
			information.setHotline(inforObJect.getString("hotline"));
			information.setName(inforObJect.getString("name"));
			information.setTimeopen(inforObJect.getString("timeopen"));
			information.setTimeclose(inforObJect.getString("timeclose"));
			information.setType(inforObJect.getString("type"));
			information.setIntroduction(inforObJect.getString("intro"));
			information.setNumber(inforObJect.getString("number"));
			information.setWard(inforObJect.getString("ward"));
			information.setStreet(inforObJect.getString("street"));
			information.setDistrict(inforObJect.getString("district"));
			information.setProvince(inforObJect.getString("province"));
			information.setUrlpartner(inforObJect.getString("urlpartner"));
			List<String> listImage = new ArrayList<>();
			try {
			JSONArray jsonAnh = inforObJect.getJSONArray("images");
			for (int j = 0; j < jsonAnh.length(); j++) {
			JSONObject recimg = jsonAnh.getJSONObject(j);
			JSONObject obj= recimg.getJSONObject("id");
			listImage.add(obj.getString("imageurl"));
			}
			}catch (JSONException e){
			JSONObject abc = inforObJect.getJSONObject("images");
			JSONObject obj= abc.getJSONObject("id");
			listImage.add(obj.getString("imageurl"));
			}

			information.setImages(listImage);
			inforRating.setInFor(information);
			listInfor.add(inforRating);
			}
			return listInfor;
		}
			
			catch(JSONException e)
			{
				JSONObject rec = jsonObject.getJSONObject("InformationRating");
				InforRating inforRating = new InforRating();
				inforRating.setRating(rec.getLong("rating"));
				inforRating.setPrice(rec.getLong("price"));
				JSONObject inforObJect = rec.getJSONObject("infor");
				Information information = new Information();
				information.setId(inforObJect.getString("id"));
				information.setHotline(inforObJect.getString("hotline"));
				information.setName(inforObJect.getString("name"));
				information.setTimeopen(inforObJect.getString("timeopen"));
				information.setTimeclose(inforObJect.getString("timeclose"));
				information.setType(inforObJect.getString("type"));
				information.setIntroduction(inforObJect.getString("intro"));
				information.setNumber(inforObJect.getString("number"));
				information.setWard(inforObJect.getString("ward"));
				information.setStreet(inforObJect.getString("street"));
				information.setDistrict(inforObJect.getString("district"));
				information.setProvince(inforObJect.getString("province"));
				information.setUrlpartner(inforObJect.getString("urlpartner"));
				List<String> listImage = new ArrayList<>();
				try {
				JSONArray jsonAnh = inforObJect.getJSONArray("images");
				for (int j = 0; j < jsonAnh.length(); j++) {
				JSONObject recimg = jsonAnh.getJSONObject(j);
				JSONObject obj= recimg.getJSONObject("id");
				listImage.add(obj.getString("imageurl"));
				}
				}catch (JSONException e1){
				JSONObject abc = inforObJect.getJSONObject("images");
				JSONObject obj= abc.getJSONObject("id");
				listImage.add(obj.getString("imageurl"));
				}

				information.setImages(listImage);
				inforRating.setInFor(information);
				listInfor.add(inforRating);
				return listInfor;
			
			
	}
	}
	catch(Exception e)
	{
	return null;	
	}
	}
	

}
