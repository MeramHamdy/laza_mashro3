import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:laza_mashro3/constatnt.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkLoginOrSignup(String url, http.Response response) async {
  if (url == baseUrl + 'signin.php') {
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == 'success') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
    }
  } else if (url == baseUrl + 'signup.php') {
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == 'success') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isSignUp', true);
    }
  } else {
    print('failure login ya yasmine');
  }
}
