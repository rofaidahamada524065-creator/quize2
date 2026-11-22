import 'package:flutter/material.dart';
import 'package:quize2/Models/weather_model.dart';
import 'package:quize2/Screens/details.dart';

class ListtilleWeather extends StatelessWidget {
  final Wheather whether;

  const new({super.key, required this.whether});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Details(wether: whether)),
          );
        },
        child: ListTile(
          leading: Image.network(whether.countryImageUrl),
          title: Text(whether.name),
          subtitle: Text("${whether.tempreature}C"),
        ),
      ),
    );
  }
}
