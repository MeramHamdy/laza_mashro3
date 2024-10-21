import 'dart:convert';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/helper/api.dart';
import 'package:laza_mashro3/models/authentication_model.dart';

class SignUpService {
  Future<AuthenticationModel> SignUp({
    required String userName,
    required String gmail,
    required String pass,
    required String profilePicture,
  }) async {
    final jsonBody = jsonEncode({
      "username": userName,
      "email": gmail,
      "password": pass,
      'profile_picture': profilePicture,
    });
    Map<String, dynamic> data;
    try {
      data = await Api().post(
        url: baseUrl + 'signup.php',
        body: jsonBody,
      );
      print('API Response: $data');
    } catch (e) {
      print("Error during API call: ${e.toString()}");
      throw Exception("Failed to contact the server.");
    }

    if (data == null) {
      throw Exception("API response is null");
    }
    return AuthenticationModel.fromJson(data);
  }
}
