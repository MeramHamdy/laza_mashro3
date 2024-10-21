import 'dart:convert';
import 'package:laza_mashro3/helper/api.dart';
import 'package:laza_mashro3/models/authentication_model.dart';

class ForgetPasswordService {
  Future<AuthenticationModel> forgetPassword({
    required String email,
    required String url,
  }) async {
    final jsonBody = jsonEncode({"email": email});
    Map<String, dynamic> data =
        await Api().postForget(url: url, body: jsonBody);
    return AuthenticationModel.fromJson(data);
  }
}
