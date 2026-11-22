class WeatherModel {
  final List<Wheather> withwrdata;

  new({required this.withwrdata});
  factory WeatherModel.fromjson(Map json) {
    final templist = json["country"]
        .map<Wheather>(
          (item) => Wheather(
            name: item["name"],
            tempreature: item["tempreature"],
            weatherCondition: item["weatherCondition"],
            countryImageUrl: item["countryImageUrl"],
            weatherImageUrl: item["weatherImageUrl"],
          ),
        )
        .toList();
    return WeatherModel(withwrdata: templist);
  }
}

class Wheather {
  final String name;
  final String tempreature;
  final String weatherCondition;
  final String countryImageUrl;
  final String weatherImageUrl;

  Wheather({
    required this.name,
    required this.tempreature,
    required this.weatherCondition,
    required this.countryImageUrl,
    required this.weatherImageUrl,
  });
}
