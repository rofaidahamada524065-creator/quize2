import 'package:flutter/foundation.dart';
import 'package:quize2/Models/auth_model.dart';
import 'package:quize2/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? authModel;
  Future<void> Signuprequst({
    required String name,
    required String phone,
    required String password,
    required String email,
  }) async {
    authModel = await AuthServices.SignUpServices(
      name: name,
      phone: phone,
      password: password,
      email: email,
    );
    notifyListeners();
  }

  Future<void> Loginprequst({
    required String password,
    required String email,
  }) async {
    authModel = await AuthServices.LoginServices(
      password: password,
      email: email,
    );
    notifyListeners();
  }
}
