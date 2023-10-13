import 'package:flutter/material.dart';

import 'api.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key, required this.cityName, required this.parkName});
  String cityName = "";
  String parkName = "";

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.parkName),
        ),
        body: Column(
          children: [
            Center(child: Text("Weather in ${widget.parkName}")),
            Center(
              child: FutureBuilder(
                future: API().getTemperature(widget.cityName),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text("ERROR :(");
                  } else if (snapshot.hasData) {
                    final temperature = snapshot.data;
                    return Text("$temperature F");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ));
  }
}
