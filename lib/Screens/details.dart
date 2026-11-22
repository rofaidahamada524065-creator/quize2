import 'package:flutter/material.dart';
import 'package:quize2/Models/weather_model.dart';

class Details extends StatelessWidget {
  final Wheather wether;

  const new({super.key, required this.wether});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wether.name, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          child: Container(
            width: 500,
            height: 300,

            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(wether.weatherImageUrl),
                ),

                Text(
                  wether.name,
                  style: TextStyle(fontSize: 25, fontWeight: .bold),
                ),
                Text(
                  "Weather : ${wether.weatherCondition}",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "Temprature : ${wether.tempreature} C",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
