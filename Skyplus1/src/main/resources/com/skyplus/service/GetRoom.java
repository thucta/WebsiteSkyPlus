package skyplus.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import entity.Room;
import skyplus.config.Config;

public class GetRoom {
	public static List<Room> getRoom(Integer idInfor) {
		 String data = BasicService.getData(Config.URLADDRESS + "/infor/" + idInfor + "/room");
		 System.out.println(Config.URLADDRESS + "/infor/" + idInfor + "/room");
		List<Room> room = new ArrayList<>();
		JSONObject jsonObject = new JSONObject(data);
		try
		{
			JSONObject roomitem= jsonObject.getJSONObject("room");
			Room temp = new Room();
			temp.setId(roomitem.getInt("id"));
			temp.setDetail(roomitem.getString("detail"));
			temp.setPrice(roomitem.getInt("price"));
			temp.setMaxpeople(roomitem.getInt("maxpeople"));
			temp.setQuanlity(roomitem.getString("quanlity"));
			temp.setType(roomitem.getString("type"));
			temp.setImage(roomitem.getString("image"));
			room.add(temp);
			return room;
		}
		catch (Exception e) {
			// TODO: handle exception
			JSONArray roomarray = jsonObject.getJSONArray("room");
			for(int i=0;i<roomarray.length();i++)
			{
				JSONObject roomitem= (JSONObject) roomarray.get(i);
				Room temp = new Room();
				temp.setId(roomitem.getInt("id"));
				temp.setDetail(roomitem.getString("detail"));
				temp.setPrice(roomitem.getInt("price"));
				temp.setMaxpeople(roomitem.getInt("maxpeople"));
				temp.setQuanlity(roomitem.getString("quanlity"));
				temp.setType(roomitem.getString("type"));
				temp.setImage(roomitem.getString("image"));
				room.add(temp);
			}
			return room;
		}
	}
}
