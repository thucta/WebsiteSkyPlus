package skyplus.service;

import org.json.JSONObject;

import entity.Information;
import skyplus.config.Config;

public class GetInforFollowRoom {
	public static Information GetInfors(int idRoom)
	{
		String data = BasicService.getData(Config.URLADDRESS + "/infor/getinforfollowroom?id=" + idRoom);
		try
		{
		System.out.println(Config.URLADDRESS + "/infor/getinforfollowroom?id=" + idRoom);
		JSONObject jsonObject = new JSONObject(data);
		Information information = new Information();
		information.setName(jsonObject.getString("name"));
		information.setNumber(jsonObject.getString("number"));
		information.setStreet(jsonObject.getString("street"));
		information.setDistrict(jsonObject.getString("district"));
		information.setWard(jsonObject.getString("ward"));
		information.setProvince(jsonObject.getString("province"));
		System.out.println(information.getName());
		return information;
		
		}
		catch(Exception e)
		{
			return null;
		}
	}

}
