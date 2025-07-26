import 'package:ayden_davis_portfolio_website/projects/weather_app/screens/city_screen.dart';
import 'package:ayden_davis_portfolio_website/projects/weather_app/services/weather.dart';
import 'package:ayden_davis_portfolio_website/projects/weather_app/utilities/constants.dart';
import 'package:flutter/material.dart';

WeatherModel weather = WeatherModel();

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final dynamic locationWeather;

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  String? weatherIcon;
  String? weatherMessage;
  int? temperature;
  String? cityName;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'unable to get weather data';
        cityName = '';
        return;
      }
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weather.getMessage(temperature!);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    icon: Icon(Icons.near_me, size: 50.0),
                    tooltip: 'Clear Location',
                  ),
                  IconButton(
                    onPressed: () async {
                      var typedCity = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );

                      if (typedCity != null) {
                        var weatherData = await weather.getSpecificLocationWeather(typedCity);
                        updateUI(weatherData);
                      }
                    },
                    icon: Icon(Icons.location_city, size: 50.0),
                    tooltip: 'Choose Location',
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$temperature°', style: kTempTextStyle),
                    Text(weatherIcon!, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Center(
                  child: Text("$weatherMessage, in $cityName", textAlign: TextAlign.right, style: kMessageTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
