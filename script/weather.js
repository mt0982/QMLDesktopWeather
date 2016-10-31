
var city;

function setCityName(name) {
    city = name;
}

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

    console.log("Country: " + country + "\n" +
                "Temp: " + temp.toPrecision(4) + "\n" +
                "Wind: " + wind_speed + "m/s\n" +
                "Wind: " + wind_direction + "deg\n" +
                "Cloudiness: " + clouds + "%\n" +
                "Pressure: " + pressure + "Hpa\n" +
                "Humidity: " + humidity + "%\n" +
                "Longitude: " + longitude + "\n" +
                "Latitude: " + latitude + "\n" +
                "Description: " + description + "\n")

    /* Set Output Data */
    page1.cityName = city;
    page1.countryName = country;
    page1.cityTemperature = temp.toFixed(2);
    page1.setTemperature(temp.toFixed(2), "Feels Like")
    page1.setHumidity(humidity, "Humidity")
    page1.setCloudiness(clouds, "Clouds")
    //page1.cityLatitude = latitude;
    //page1.cityLongitude = longitude;
    page1.setWind(wind_speed, "Wind")
    page1.setPressure(pressure, "Pressure")
    //page1.weathericon = "http://openweathermap.org/img/w/" + weathericon + ".png"
}













