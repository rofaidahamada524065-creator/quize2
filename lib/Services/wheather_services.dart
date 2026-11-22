import 'package:dio/dio.dart';
import 'package:quize2/Models/weather_model.dart';

class WheatherServices {
  static Dio dio = Dio();
  static Future<WeatherModel> WeatherRequest() async {
    try {
      Response response = await dio.get(
        "https://iats.runasp.net/api/Country/GetCountries",
      );
      return WeatherModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (other) {
      throw Exception("error:${other.toString()}");
    }
  }
}
