package skyplus.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import entity.Food;
import skyplus.config.Config;

public class GetFood {
	public static List<Food> getFood(Integer idInfor) {
		 String data = BasicService.getData(Config.URLADDRESS + "/infor/" + idInfor + "/food");
		 System.out.println(Config.URLADDRESS + "/infor/" + idInfor + "/food");
		List<Food> food = new ArrayList<>();
		JSONObject jsonObject = new JSONObject(data);
		try
		{
			JSONObject fooditem= jsonObject.getJSONObject("food");
			Food temp = new Food();
			temp.setFoodname(fooditem.getString("foodname"));
			temp.setDetail(fooditem.getString("detail"));
			temp.setPrice(fooditem.getInt("price"));
			temp.setImage(fooditem.getString("image"));
			food.add(temp);
			return food;
		}
		catch (Exception e) {
			// TODO: handle exception
			JSONArray foodarray = jsonObject.getJSONArray("food");
			for(int i=0;i<foodarray.length();i++)
			{
				JSONObject fooditem= (JSONObject) foodarray.get(i);
				Food temp = new Food();
				temp.setFoodname(fooditem.getString("foodname"));
				temp.setDetail(fooditem.getString("detail"));
				temp.setPrice(fooditem.getInt("price"));
				temp.setImage(fooditem.getString("image"));
				food.add(temp);
			}
			return food;
		}
	}
	
	
}
