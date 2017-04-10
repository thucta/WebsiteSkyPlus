package skyplus.service;

import org.json.JSONObject;

import skyplus.config.Config;

public class CheckEmailService {
	
	public static String checkEmail(String email) {
		
		String input = BasicService.getData(Config.URLADDRESS+"/user/checkemail?email="+email);
		JSONObject data = new JSONObject(input);
		String result = data.getString("result");		
		System.out.println(result);
		return result;
	}

}
