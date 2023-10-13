import 'package:disney_weather/weather_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Disney Parks Weather")),
        body: ListView(
          children: [
            WeatherButton(parkName: "Walt Disney World", cityName: "Orlando"),
            WeatherButton(parkName: "Disneyland", cityName: "Los Angeles"),
            WeatherButton(parkName: "Disneyland Paris", cityName: "Paris"),
            WeatherButton(parkName: "Tokyo Disneyland", cityName: "Tokyo"),
          ],
        ));
  }
}

class WeatherButton extends StatelessWidget {
  String parkName;
  String cityName;
  WeatherButton({
    required this.parkName,
    required this.cityName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return WeatherPage(cityName: cityName, parkName: parkName);
            },
          ));
        },
        child: Text(parkName));
  }
}
