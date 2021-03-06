
var city;

function setCityName(name) { city = name; }

function addZero(i) {
    if (i < 10) i = "0" + i;
    return i;
}

/* 1 Day */
function parseJSON() {
    var weatherAppKey = "f23961cb493d52dbd56fd0d656b3a396";

    if (weatherAppKey != "") {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + weatherAppKey);

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                parseWeatherData(a);
            }
        }
        xhr.send();
    } else {
        console.log("ERROR: No App Key")
    }
}

function parseWeatherData(weatherData) {

    page1.clearList();

    var temp = weatherData.main.temp - 273.15;
    var temp_min = weatherData.main.temp_min - 272.15;
    var temp_max = weatherData.main.temp_max - 272.15;
    var wind_speed = weatherData.wind.speed;                //m/sec
    var wind_direction = weatherData.wind.deg;              //angle
    var clouds = weatherData.clouds.all;                    //%
    var pressure = weatherData.main.pressure;               //hpa
    var humidity = weatherData.main.humidity;               //%
    var longitude = weatherData.coord.lon;
    var latitude = weatherData.coord.lat;
    var country = weatherData.sys.country;
    var description = weatherData.weather[0].description;
    var weathericon = weatherData.weather[0].icon;
    var sunrise = new Date(weatherData.sys.sunrise * 1000);
    var sunset = new Date(weatherData.sys.sunset * 1000);
    var sea_level = weatherData.main.sea_level;
    var grd_level = weatherData.main.grnd_level;
    var wind_deg = weatherData.wind.deg;

//    console.log("Country: " + country + "\n" +
//                "Temp: " + temp.toPrecision(4) + "\n" +
//                "Wind: " + wind_speed + "m/s\n" +
//                "Wind: " + wind_direction + "deg\n" +
//                "Cloudiness: " + clouds + "%\n" +
//                "Pressure: " + pressure + "Hpa\n" +
//                "Humidity: " + humidity + "%\n" +
//                "Longitude: " + longitude + "\n" +
//                "Latitude: " + latitude + "\n" +
//                "Description: " + description + "\n")

    /* Set Output Data */
    page1.cityName = city;
    page1.countryName = country;
    page1.cityTemperature = temp.toFixed(2);
    page1.cityDescription = description
    page1.setTemperature(temp.toFixed(2), "Feels Like")
    page1.setHumidity(humidity, "Humidity")
    page1.setCloudiness(clouds, "Clouds")
    //page1.cityLatitude = latitude;
    //page1.cityLongitude = longitude;
    page1.setWind(wind_speed, "Wind")
    page1.setPressure(pressure, "Pressure")
    page1.setSeaLevel(sea_level, "Pr. (Sea)")
    page1.setGndLevel(grd_level, "Pr. (Gnd)")
    page1.setwindDeg(wind_deg, "Wind Dir.")
    page1.cityWeatherIcon = "http://openweathermap.org/img/w/" + weathericon + ".png"
    page1.setSunrise(sunrise.getHours() + ":" + addZero(sunrise.getMinutes()), "Sunrise")
    page1.setSunset(sunset.getHours() + ":" + addZero(sunset.getMinutes()), "Sunrise")
    page1.weatherUpdateTime = new Date(weatherData.dt * 1000);
}

/* 16 Days */
function parseJSON16Days() {
    var weatherAppKey = "f23961cb493d52dbd56fd0d656b3a396";

    if (weatherAppKey != "") {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://api.openweathermap.org/data/2.5/forecast/daily?q=" + city + "&appid=" + weatherAppKey +
                 "&cnt=16");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                parseWeatherData16Days(a);
            }
        }
        xhr.send();
    } else {
        console.log("ERROR: No App Key")
    }
}

function parseWeatherData16Days(weatherData) {

    /* Clear Data */
    page1.clearDayList()
    page1.clearList()

    /* Push To ListView */
    for(var i = 0; i < weatherData.cnt; i++) {
        var dt = new Date(weatherData.list[i].dt * 1000);
        var mmdd = (dt.getUTCMonth() + 1) + "." + addZero(dt.getDate())
        var temp_max = weatherData.list[i].temp.max - 273.15
        var temp_min = weatherData.list[i].temp.min - 273.15
        var temp_eve = weatherData.list[i].temp.eve - 273.15
        var temp_night = weatherData.list[i].temp.night - 273.15
        var temp_morn = weatherData.list[i].temp.morn - 273.15
        var temp_day = weatherData.list[i].temp.day - 273.15
        var pressure = weatherData.list[i].pressure
        var humidity = weatherData.list[i].humidity
        var wind_speed = weatherData.list[i].speed
        var wind_deg = weatherData.list[i].deg
        var clouds = weatherData.list[i].clouds


        if(mmdd == page1.dayDate) {
            page1.setTemperature(temp_max.toFixed(2), "Temp Max")
            page1.setTemperature(temp_min.toFixed(2), "Temp Min")
            page1.setCloudiness(clouds, "Clouds")
            page1.setPressure(pressure, "Pressure")
            page1.setHumidity(humidity, "Humidity")
            page1.setWind(wind_speed, "Wind")
            page1.setwindDeg(wind_deg, "Wind Deg.")
        }

        /* Push To ListView */
        page1.addDay(mmdd)
    }
}

/* 5 Days */
function parseJSON5Days() {
    var weatherAppKey = "f23961cb493d52dbd56fd0d656b3a396";

    if (weatherAppKey != "") {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "http://api.openweathermap.org/data/2.5/forecast?q=" + city + "&appid=" + weatherAppKey +
                 "&cnt=16");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                parseWeatherData5Days(a);
            }
        }
        xhr.send();
    } else {
        console.log("ERROR: No App Key")
    }
}

function parseWeatherData5Days(weatherData) {

    /* Clear Container */
    page2.clear();
    page3.clear();
    page4.clear()
    page5.clear()

    /* Set City And Country Name */
//    temperaturePage.cityName = city;
//    cloudsPage.cityName = city;
//    pressurePage.cityName = city;
//    windPage.cityName = city;
//    temperaturePage.countryName = weatherData.city.country;
//    cloudsPage.countryName = weatherData.city.country;
//    pressurePage.countryName = weatherData.city.country;
//    windPage.countryName = weatherData.city.country;

    /* Properties */
    var mintemp = 99;
    var maxtemp = -99;
    var maxDate = new Date();
    var pressureMin = 5000;
    var pressureMax = -5000;
    var windMin = 5000;
    var windMax = -5000;

    for(var i = 0; i < weatherData.cnt; i++) {
        var temperature = (weatherData.list[i].main.temp - 273.15).toFixed(2);
        var temperature_min = (weatherData.list[i].main.temp_min - 273.15).toFixed(2);
        var temperature_max = (weatherData.list[i].main.temp_max - 273.15).toFixed(2);
        var pressure = (weatherData.list[i].main.pressure).toFixed(2);
        var clouds = weatherData.list[i].clouds.all;
        var wind = weatherData.list[i].wind.speed;
        var date = new Date(weatherData.list[i].dt_txt);

        page2.append(date.getTime(), temperature);
        page2.append2(date.getTime(), temperature_min - Math.random());
        page2.append3(date.getTime(), Number(temperature_max) + Math.random());
        page3.append(date.getTime(), pressure);
        page4.append(date.getTime(), clouds);
        page5.append(date.getTime(), wind);

        mintemp = Math.min(mintemp, temperature);
        maxtemp = Math.max(maxtemp, temperature);
        pressureMin = Math.min(pressureMin, pressure);
        pressureMax = Math.max(pressureMax, pressure);
        windMin = Math.min(windMin, wind);
        windMax = Math.max(windMax, wind);
        maxDate = Math.max(maxDate, date);
    }

    page2.xAxisRange(new Date(), new Date(maxDate));
    page2.yAxisRange(mintemp - 1, maxtemp + 1);
    page3.xAxisRange(new Date(), new Date(maxDate));
    page3.yAxisRange(pressureMin - 10, pressureMax + 10);
    page4.xAxisRange(new Date(), new Date(maxDate));
    page4.yAxisRange(-10, 110);
    page5.xAxisRange(new Date(), new Date(maxDate));
    page5.yAxisRange(windMin - 1, windMax + 1);
}










