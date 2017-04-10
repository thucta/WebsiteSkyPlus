package skyplus.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class BasicService {

	public static String getData(String url) {
		StringBuilder content = new StringBuilder();
		try {
			URL url1 = new URL(url);
			System.out.println(url);
			BufferedReader reader = new BufferedReader(new InputStreamReader(url1.openStream(), "UTF-8"));
			String line;
			while ((line = reader.readLine()) != null) {
				content.append(line);
			}
			reader.close();
		} catch (MalformedURLException e) {
		} catch (IOException e) {
			return null;
		}
		return content.toString();
	}
}
