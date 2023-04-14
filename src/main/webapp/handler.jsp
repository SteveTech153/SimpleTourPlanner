<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="css/result.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/fontAwesome.css">
        <link rel="stylesheet" href="css/hero-slider.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <link rel="stylesheet" href="css/tooplate-style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body>
<div class="container1">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <img src="img/logo.svg" alt="" id="logo" class="logo">
        <a class="navbar-brand" href="#">Triplan</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
         
          </ul>
        </div>
      </nav>
    
<%@page	import=" java.util.ArrayList,java.util.Arrays,java.util.Scanner,java.util.Calendar,java.util.Date,java.util.concurrent.TimeUnit,java.text.SimpleDateFormat" %>
<%!
String[] citiesArr = {"chennai","coimbatore","madurai","trichy","salem","tirunelveli","tirupur","vellore","erode","thoothukudi","dindigul","thanjavur","ranipet","sivakasi","karur","ooty","hosur","nagercoil","kanchipuram","kumarapalayam","karaikudi","neyveli","cuddalore","kumbakonam","tiruvannamalai","pollachi","rajapalayam","gudiyatham","pudukottai","vaniyambadi","ambur","nagapattinam","kanyakumari","virudhunagar"};
ArrayList<String> cities = new ArrayList<>(Arrays.asList(citiesArr));
ArrayList<Double> lattitudes = new ArrayList<>();
ArrayList<Double> longitudes = new ArrayList<>();
String plan = "";
public double distance(double lat1,double lat2, double lon1, double lon2)
{
	// The math module contains a function
    // named toRadians which converts from
    // degrees to radians.
    lon1 = Math.toRadians(lon1);
    lon2 = Math.toRadians(lon2);
    lat1 = Math.toRadians(lat1);
    lat2 = Math.toRadians(lat2);

    // Haversine formula
    double dlon = lon2 - lon1;
    double dlat = lat2 - lat1;
    double a = Math.pow(Math.sin(dlat / 2), 2)
            + Math.cos(lat1) * Math.cos(lat2)
            * Math.pow(Math.sin(dlon / 2),2);

    double c = 2 * Math.asin(Math.sqrt(a));

    // Radius of earth in kilometers. Use 3956
    // for miles
    double r = 6371;

    // calculate the result
    return(c * r) + (c * r)*25/100;
}
    public double timeToTravel(String city1,String city2){
	    if(cities.contains(city1) && cities.contains(city2)) {
	        int index1 = cities.indexOf(city1);
	        int index2 = cities.indexOf(city2);
	        double lat1 = lattitudes.get(index1);
	        double lat2 = lattitudes.get(index2);
	        double lon1 = longitudes.get(index1);
	        double lon2 = longitudes.get(index2);
	        double distance = distance(lat1, lat2, lon1, lon2);
	        double time = distance / 60;
	        return time;
	    }else
	        return -1;
    }
    public String nearestCity(String city, ArrayList<String> destCities){
        double minTime = 1000000000;
        String nearestCity = "";
        for(int i=0;i<destCities.size();i++){
            if(destCities.get(i).equals(city)){
                continue;
            }
            double time = timeToTravel(city,destCities.get(i));
            if(time<minTime){
                minTime = time;
                nearestCity = destCities.get(i);
            }
        }
        return nearestCity;
    }
    private double round (double value, int precision) {
        int scale = (int) Math.pow(10, precision);
        return (double) Math.round(value * scale) / scale;
    }
    public String planTrip(int totalDays, int budget, String startingCity, ArrayList<String> destCities,int startTime,int hotelFare) {
       // no travelling after 20:00
        //no travelling before 6:00
        // stay in hotel after 20:00
        // visit each city for 5 hours
        // display time fomat as hh:mm
        String currentCity = startingCity;
        int totalMoneySpent = 0,totalCities=destCities.size();
        int totalDaysSpent = 0,citiesVisited=0;
        int time = startTime;
        int timeSpentInACity = 0;
        while (totalDaysSpent < totalDays && totalMoneySpent < budget && citiesVisited<=totalCities+1) {
            if(time>22){
                time = 8;
                totalDaysSpent++;
                totalMoneySpent+=hotelFare;
                plan+="Hotel Stay in "+currentCity+" for 1 night\n";
                budget-=hotelFare;
//                
            }else{
                if(timeSpentInACity!=5) {
                    if (time + 5 - timeSpentInACity <= 22) {
                        totalMoneySpent += 2000;
                        plan += "Visit " + currentCity + " from " + time + ":00 to " + (time + 5 - timeSpentInACity) + ":00\n";
                    
                        time += 5 - timeSpentInACity;
                        timeSpentInACity = 5;
                        budget -= 2000;
                        citiesVisited++;
                    } else {
                        plan += "Visit " + currentCity + " from " + time + ":00 to " + (22) + ":00\n";
                        timeSpentInACity = 22 - time;
                        time = 23;
                    }
                }              
                if(time<=22 && 2000<=budget &&  citiesVisited<=totalCities+1){
                    String nearestCity = nearestCity(currentCity,destCities);

                    double timeToTravel = timeToTravel(currentCity,nearestCity);
                    if(timeToTravel==-1) {
                        break;
                    }
                    if(time+timeToTravel<=22 ){
                        time+= Math.round(timeToTravel);
                        plan+="Travel from "+currentCity+" to "+nearestCity+" for "+round(timeToTravel,1)+" hours\n";
                   
                        lattitudes.remove(cities.indexOf(currentCity));
                        longitudes.remove(cities.indexOf(currentCity));
                        destCities.remove(currentCity);
                        cities.remove(currentCity);
                        currentCity = nearestCity;
//                 
                        timeSpentInACity=0;
                        nearestCity = nearestCity(currentCity,destCities);
                    }else{
//                      
                        time = 23;
//                      
                    }
                }
            }
        }

        if(citiesVisited<totalCities)
            plan += "money not enough !\n";
        else
            plan+="money remaining "+budget+"\n";
        return plan;
    } 
    public long getDifferenceDays(Date d1, Date d2) {
	    long diff = d2.getTime() - d1.getTime();
	    return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
	}
%>
<%
   
		lattitudes.addAll(Arrays.asList(13.0827,11.0168,9.9252,10.7905,11.6643,8.7139,11.1085,12.9165,11.3410,8.7642,10.3624,10.7870,12.9487,9.4533,10.9601,11.4102,12.7409,8.1833,12.8185,11.4635,10.0735,11.5390,11.7480,10.9602,12.2253,10.6609,9.4515,12.9428,10.3833,12.6825,12.7802,10.7672,8.0883,9.5680));
		longitudes.addAll(Arrays.asList(80.2707,76.9558,78.1198,78.7047,78.1460,77.77567,77.3411,79.1325,77.7172,78.1348,77.9695,79.1378,79.3190,77.8024,78.0766,76.6950,77.8253,77.4119,79.6947,77.7232,78.7732,79.4794,79.7714,79.3845,79.0747,77.0048,77.5543,78.8682,78.8001,78.6167,78.7177,79.8449,77.5385,77.9624));
		 Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("departureDate"));  
		Date date2=new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("returnDate"));
       	long totalDays =  getDifferenceDays(date1,date2);
        int budget = Integer.parseInt(request.getParameter("Budget"));
        String startingCity = request.getParameter("startingCity");
        String[] destCities1 = request.getParameterValues("destinations");
        ArrayList<String> destCities = new ArrayList<>(Arrays.asList(destCities1));
		//out.println(destCities);
        int startTime = 6;
        int noOfCities=destCities.size();
        int hotelFare = Integer.parseInt(request.getParameter("hotelFare"));
        String res = planTrip(Integer.parseInt( Long.toString( totalDays)), budget, startingCity, destCities, startTime,hotelFare);
        String resArr[] = res.split("\n");
        for(int i1=0;i1<resArr.length;i1++){
        	out.println("<div class=\"box\">"+resArr[i1]);
        	if(resArr[i1].contains("Travel")){
        		out.println("<img src=\"img/car.svg\" alt=\"\" id=\"logo1\" class=\"logo1\">");
        	}else if(resArr[i1].contains("Hotel")){
        		out.println("<img src=\"img/hotel.svg\" alt=\"\" id=\"logo1\" class=\"logo1\">");
        	}else if(resArr[i1].contains("Visit")){
        		out.println("<img src=\"img/travel.svg\" alt=\"\" id=\"logo1\" class=\"logo1\">");
        	}else if(resArr[i1].contains("remaining")){
        		out.println("<img src=\"img/money.svg\" alt=\"\" id=\"logo1\" class=\"logo1\">");
        		break;
        	}
        	out.println("</div>");
        }
        out.println("</div>");
        out.println("</div>");
	%>
	</div>
</body>
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</html>