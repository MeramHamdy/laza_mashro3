import 'dart:convert';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/helper/api.dart';
import 'package:laza_mashro3/models/authentication_model.dart';

class LogInService {
  Future<AuthenticationModel> LogIn({
    required String email,
    required String password,
  }) async {
    final jsonBody = jsonEncode({
      "email": email,
      "password": password,
    });

    Map<String, dynamic> data = await Api().post(
      url: baseUrl + 'signin.php',
      body: jsonBody,
    );

    return AuthenticationModel.fromJson(data);
  }
}
