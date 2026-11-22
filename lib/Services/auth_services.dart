import 'package:dio/dio.dart';
import 'package:quize2/Models/auth_model.dart';

class AuthServices {
  static Dio dio = Dio();

  static Future<AuthModel> SignUpServices({
    required String name,
    required String phone,
    required String password,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "name": name,
          "phone": phone,
          "password": password,
          "email": email,
        },
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (other) {
      throw Exception("Error : ${other.toString()}");
    }
  }

  static Future<AuthModel> LoginServices({
    required String password,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"password": password, "email": email},
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (other) {
      throw Exception("Error : ${other.toString()}");
    }
  }
}
