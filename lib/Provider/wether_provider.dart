import 'package:flutter/material.dart';
import 'package:quize2/Models/weather_model.dart';
import 'package:quize2/Services/wheather_services.dart';

class WetherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  Future<void> WeatherPro() async {
    weatherModel = await WheatherServices.WeatherRequest();
    notifyListeners();
  }
}
