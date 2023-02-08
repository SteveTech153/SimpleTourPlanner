jQuery(document).ready(function($) {

	'use strict';
      
      $('#form-submit .date').datepicker({
      });

      var owl = $("#owl-suiteroom");

        owl.owlCarousel({
          
          pagination : true,
          paginationNumbers: false,
          autoPlay: 6000, //Set AutoPlay to 3 seconds
          items : 1, //10 items above 1000px browser width
          itemsDesktop : [1000,1], //5 items between 1000px and 901px
          itemsDesktopSmall : [900,1], // betweem 900px and 601px
          itemsTablet: [600,1], //2 items between 600 and 0
          itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
          
      });


      var owl = $("#owl-mostvisited");

        owl.owlCarousel({
          
          pagination : true,
          paginationNumbers: false,
          autoPlay: 6000, //Set AutoPlay to 3 seconds
          items : 4, //10 items above 1000px browser width
          itemsDesktop : [1000,4], //5 items between 1000px and 901px
          itemsDesktopSmall : [900,2], // betweem 900px and 601px
          itemsTablet: [600,1], //2 items between 600 and 0
          itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
          
      });


        
        $('.recommendedgroup > div').hide();
        $('.recommendedgroup > div:first-of-type').show();
        $('.tabs a').click(function(e){
          e.preventDefault();
            var $this = $(this),
            tabgroup = '#'+$this.parents('.tabs').data('recommendedgroup'),
            others = $this.closest('li').siblings().children('a'),
            target = $this.attr('href');
        others.removeClass('active');
        $this.addClass('active');
        $(tabgroup).children('div').hide();
        $(target).show();
      
        })


        $('.weathergroup > div').hide();
        $('.weathergroup > div:first-of-type').show();
        $('.tabs a').click(function(e){
          e.preventDefault();
            var $this = $(this),
            tabgroup = '#'+$this.parents('.tabs').data('weathergroup'),
            others = $this.closest('li').siblings().children('a'),
            target = $this.attr('href');
        others.removeClass('active');
        $this.addClass('active');
        $(tabgroup).children('div').hide();
        $(target).show();
      
        })


        $('.tabgroup > div').hide();
        $('.tabgroup > div:first-of-type').show();
        $('.tabs a').click(function(e){
          e.preventDefault();
            var $this = $(this),
            tabgroup = '#'+$this.parents('.tabs').data('tabgroup'),
            others = $this.closest('li').siblings().children('a'),
            target = $this.attr('href');
        others.removeClass('active');
        $this.addClass('active');
        $(tabgroup).children('div').hide();
        $(target).show();
      
        })



        $(".pop-button").click(function () {
            $(".pop").fadeIn(300);
            
        });

        $(".pop > span").click(function () {
            $(".pop").fadeOut(300);
        });


        $(window).on("scroll", function() {
            if($(window).scrollTop() > 100) {
                $(".header").addClass("active");
            } else {
                //remove the background property so it comes transparent again (defined in your css)
               $(".header").removeClass("active");
            }
        });


	/************** Mixitup (Filter Projects) *********************/
    	$('.projects-holder').mixitup({
            effects: ['fade','grayscale'],
            easing: 'snap',
            transitionSpeed: 400
        });
});

//can you convert my java code to javascript
    let citiesArr = ["chennai","coimbatore","madurai","trichy","salem","tirunelveli","tirupur","vellore","erode","thoothukudi","dindigul","thanjavur","ranipet","sivakasi","karur","ooty","hosur","nagercoil","kanchipuram","kumarapalayam","karaikudi","neyveli","cuddalore","kumbakonam","tiruvannamalai","pollachi","rajapalayam","gudiyatham","pudukottai","vaniyambadi","ambur","nagapattinam","kanyakumari","virudhunagar"];
    let cities = new Array();    
    let lattitudes = new Array();
    let longitudes = new Array();
    let plan = "";   
    function tourplanning() {
        lattitudes.push(13.0827,11.0168,9.9252,10.7905,11.6643,8.7139,11.1085,12.9165,11.3410,8.7642,10.3624,10.7870,12.9487,9.4533,10.9601,11.4102,12.7409,8.1833,12.8185,11.4635,10.0735,11.5390,11.7480,10.9602,12.2253,10.6609,9.4515,12.9428,10.3833,12.6825,12.7802,10.7672,8.0883,9.5680);
        longitudes.push(80.2707,76.9558,78.1198,78.7047,78.1460,77.77567,77.3411,79.1325,77.7172,78.1348,77.9695,79.1378,79.3190,77.8024,78.0766,76.6950,77.8253,77.4119,79.6947,77.7232,78.7732,79.4794,79.7714,79.3845,79.0747,77.0048,77.5543,78.8682,78.8001,78.6167,78.7177,79.8449,77.5385,77.9624);
    }
    // Javascript program for the haversine formula 
      function haversine(lat1, lon1, lat2, lon2)
      {
        // distance between latitudes
        // and longitudes
        let dLat = (lat2 - lat1) * Math.PI / 180.0;
        let dLon = (lon2 - lon1) * Math.PI / 180.0;
        
        // convert to radiansa
        lat1 = (lat1) * Math.PI / 180.0;
        lat2 = (lat2) * Math.PI / 180.0;
        
        // apply formulae
        let a = Math.pow(Math.sin(dLat / 2), 2) +
            Math.pow(Math.sin(dLon / 2), 2) *
            Math.cos(lat1) *
            Math.cos(lat2);
        let rad = 6371;
        let c = 2 * Math.asin(Math.sqrt(a));
        return rad * c;
        
      }
      function timeToTravel(city1,city2){
        if(cities.includes(city1) && cities.includes(city2)) {
            let index1 = cities.indexOf(city1);
            let index2 = cities.indexOf(city2);
            let lat1 = lattitudes[index1];
            let lat2 = lattitudes[index2];
            let lon1 = longitudes[index1];
            let lon2 = longitudes.get(index2);
            let distance = distance(lat1, lat2, lon1, lon2);
            let time = distance / 60;
            return time;
        }else
            return -1;
      }
        function nearestCity(city,destCities){
            let minTime = 1000000000;
            let nearestCity = "";
            for(let i=0;i<destCities.length;i++){
                if(destCities[i]==city){
                    continue;
                }
                let time = timeToTravel(city,destCities[i]);
                if(time<minTime){
                    minTime = time;
                    nearestCity = destCities[i];
                }
            }
            return nearestCity;
        }
        function round (value,precision) {
            let scale =  Math.pow(10, precision);
            return Math.round(value * scale) / scale;
        }
        // document.querySelector(".planBtn").addEventListener("click", planTrip);
        const form = document.getElementById('form-submit');
        form.addEventListener('submit', planTrip);
        function planTrip ( ) {
           // no travelling after 20:00
            //no travelling before 6:00
            // stay in hotel after 20:00
            // visit each city for 5 hours
            // display time fomat as hh:mm
            //totalDays, budget, startingCity,  destCities, startTime, hotelFare
            let date1 = document.querySelector("#departureDate").value;
            let date2 = document.querySelector("#returnDate").value;
            let totalDays = Math.round((new Date(date2).getTime() - new Date(date1).getTime()) / (1000 * 3600 * 24));
            // alert(totalDays); 
            let budget = document.querySelector("#budget").value;
            let startingCity = document.querySelector("#startingCity").value;
            let noOfCities = 1;
            let destCities = document.querySelectorAll('input[name="destinations"]:checked');
            //alert(destCities[0].innerHTML+" "+destCities[1].innerHTML+" "+ destCities[2].innerHTML);
            let startTime = 6;
            let hotelFare = document.querySelector("#hotelFare").value;
            let currentCity = startingCity;
            let totalMoneySpent = 0,totalCities=destCities.length;
            let totalDaysSpent = 0,citiesVisited=0;
            let time = startTime;
            let timeSpentInACity = 0;
            while (totalDaysSpent < totalDays && totalMoneySpent < budget && citiesVisited<=totalCities+1) {
                if(time>22){
                    time = 8;
                    totalDaysSpent++;
                    totalMoneySpent+=hotelFare;
                    plan+="\nHotel Stay in "+currentCity+" for 1 night";
                    //System.out.println("Hotel Stay in "+currentCity+" for 1 night");
                    budget-=hotelFare;
//                    if(timeSpentInACity==5) {
//                        timeSpentInACity = 0;
//                    }
                }else{
                    if(timeSpentInACity!=5) {
                        if (time + 5 - timeSpentInACity <= 22) {
                            totalMoneySpent += 2000;
                            plan += "\nVisit " + currentCity + " from " + time + ":00 to " + (time + 5 - timeSpentInACity) + ":00";
                            // System.out.println("Visit "+currentCity+" from "+time+":00 to "+(time+(5-timeSpentInACity))+":00");
                            time += 5 - timeSpentInACity;
                            timeSpentInACity = 5;
                            budget -= 2000;
                            citiesVisited++;
                        } else {
                            plan += "\nVisit " + currentCity + " from " + time + ":00 to " + (22) + ":00";
                            //System.out.println("Visit "+currentCity+" from "+time+":00 to "+(22)+":00");
                            timeSpentInACity = 22 - time;
                            time = 23;
                        }
                    }               //totalMoneySpent+2000      timespentinacity==5
                    if(time<=22 && 2000<=budget &&  citiesVisited<=totalCities+1){
                        let nearestCity1 = nearestCity(currentCity,destCities);
//                        System.out.println("nearest city : "+nearestCity);
                        let timeToTravel1 = timeToTravel(currentCity,nearestCity1);
                        if(timeToTravel1==-1) {
//                            System.out.println("Invalid City");
//                            System.out.println("nearest city : "+nearestCity);
//                            System.out.println("current city : "+currentCity);
                            break;
                        }
                        if(time+timeToTravel1<=22 ){
                            time+= Math.round(timeToTravel1);
                            plan+="\nTravel from "+currentCity+" to "+nearestCity1+" for "+round(timeToTravel1,1)+" hours";
                            //System.out.println("Travel from "+currentCity+" to "+nearestCity+" for "+timeToTravel+" hours");
                            lattitudes.remove(cities.indexOf(currentCity));
                            longitudes.remove(cities.indexOf(currentCity));
                            destCities.remove(currentCity);
                          cities.remove(currentCity);
                            currentCity = nearestCity1;
//                            citiesVisited++;
//                            System.out.println("time "+time );
                            timeSpentInACity=0;
                            nearestCity1 = nearestCity(currentCity,destCities);
                        }else{
//                            if(timeSpentInACity!=5)
//                                timeSpentInACity = 22-time;
                            time = 23;
//                            System.out.println("Inside");
                        }
                    }
                }
            }

            if (citiesVisited < totalCities) {
                plan += "\nmoney not enough !";
            }
            else {
                plan += "\nmoney remaining " + budget;
            }
            //write plan to res div
            //window.location.href = "result.html";
            //alert(plan);
            document.querySelector(".result").innerHTML = plan;
        }






