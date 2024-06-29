package MyPackage;

import java.io.IOException;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/WeatherServlet")
public class WeatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WeatherServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apiKey="c5b724ee20c22d6fe5475e8730165d34";
		String city=request.getParameter("city");
		String apiUrl="https://api.openweathermap.org/data/2.5/weather?q="+ city +"&appid="+ apiKey;
		
		//Api integration
		URL url=new URL(apiUrl);
		HttpURLConnection connection=(HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		//reading the data from network
		InputStream inputStream=connection.getInputStream();
		InputStreamReader reader=new InputStreamReader(inputStream);
		
		StringBuilder responseContent=new StringBuilder();
		Scanner scanner=new Scanner(reader);
		
		while(scanner.hasNext())
		{
			responseContent.append(scanner.nextLine());
		}
		
		scanner.close();
		//parsing the data into JSON 
		Gson gson=new Gson();
		JsonObject jsonObject=gson.fromJson(responseContent.toString(),JsonObject.class);
		
		//----------------------Type Casting very important-------------------------------//
		//date and time
		long dateTimeStamp=jsonObject.get("dt").getAsLong()*1000;
		String date=new Date(dateTimeStamp).toString();
		
		//Temperature
		double tempKelvin=jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
		int tempCelsius=(int)(tempKelvin-273.15);
		
		
		//Humidity
		int humidity=jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
		
		//Wind Speed
		double windSpeed=jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
		
		//Weather Condition
		String weatherCondition=jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
		
		
		//Setting the data as Attribute
		request.setAttribute("date", date);
		request.setAttribute("city",city);
		request.setAttribute("temperature", tempCelsius);
		request.setAttribute("weatherCondition",weatherCondition);
		request.setAttribute("humidity", humidity);
		request.setAttribute("windSpeed",windSpeed);
		request.setAttribute("weatherData",responseContent.toString());
		connection.disconnect();
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}

}
