import 'package:ayden_davis_portfolio_website/projects/weather_app/screens/location_screen.dart';
import 'package:ayden_davis_portfolio_website/projects/weather_app/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SpinKitDoubleBounce(color: Colors.white, size: 100));
  }
}
