
package com.incyclesoftware.example;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WeatherForecastController {

	@GetMapping("/weatherforecast")
	@ResponseBody
	public Map<String, String> todaysWeather(@RequestParam(name="name", required=false, defaultValue="Stranger") String name) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();  
		HashMap<String, String> map = new HashMap<>();
		map.put("date", dtf.format(now) );
		map.put("temperatureC", "-5");
		map.put("temperatureF", "24");
		map.put("summary", "Snow");
		return map;
	}

}