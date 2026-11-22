import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize2/Provider/wether_provider.dart';
import 'package:quize2/Widget/listtille_weather.dart';

class Homepage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("Weather App", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<WetherProvider>(
        builder: (context, value, child) {
          final data = value.weatherModel?.withwrdata;
          if (data == null) {
            value.WeatherPro();

            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  ListtilleWeather(whether: data[index]),
            );
          }
        },
      ),
    );
  }
}
