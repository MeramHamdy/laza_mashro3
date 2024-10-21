import 'dart:convert';
import 'package:laza_mashro3/helper/api.dart';
import 'package:laza_mashro3/models/authentication_model.dart';

class UpdatePasswordService {
  Future<AuthenticationModel> updatePassword(
      {required String newPassword,
      required String email,
      required String url}) async {
    final jsonBody = jsonEncode({"newPassword": newPassword, "email": email});
    Map<String, dynamic> data =
        await Api().postForget(url: url, body: jsonBody);
    return AuthenticationModel.fromJson(data);
  }
}
