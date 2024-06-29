<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Weather App</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body style="background-color:grey">
		<%
			String wc=request.getAttribute("weatherCondition").toString();
		%>
	<div class="card w-50 mx-auto my-5" style="height:40rem;background-image:url('AllImages//<%=wc%>.jpg');background-size:cover;color:black">
		<h1>${date}</h1>
		<h1>${city}</h1>
		 
		<h1>${temperature}<sup>o</sup>C</h1>
		 <% if(wc.equals("Clear sky"))
		{%>
		<h1><img src=" https://openweathermap.org/img/wn/01d@2x.png"><%=wc%></h1>
		<%}
		else if(wc.equals("Clouds"))
		{%>
		<h1><img src=" https://openweathermap.org/img/wn/02d@2x.png"><%=wc%></h1>
		<%}
		else if(wc.equals("Rain"))
		{%>
		<h1><img src=" https://openweathermap.org/img/wn/10d@2x.png"><%=wc%></h1>
		<%}
		else if(wc.equals("Thunderstorm"))
		{%>
		<h1><img src=" https://openweathermap.org/img/wn/11d@2x.png"><%=wc%></h1>
		<%}
		else if(wc.equals("Snow"))
		{%>
		<h1><img src=" https://openweathermap.org/img/wn/13d@2x.png"><%=wc%></h1>
		<%}
		else if(wc.equals("Mist"))
		{%>
		<h1><img src=" https://openweathermap.org/img/wn/50d@2x.png"><%=wc%></h1>
		<%}
		else if(wc.equals("Haze"))
		{%>
		<h1><img src=" https://openweathermap.org/img/wn/50d@2x.png"><%=wc %></h1>
		<%}
		%>
		<h1 class="text-right">Humidity:${humidity}%</h1>
		<h1 class="text-right">Wind Speed:${windSpeed}km/h</h1>
 	</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 	
</body>
</html>