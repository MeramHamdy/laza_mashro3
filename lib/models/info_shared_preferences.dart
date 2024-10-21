import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  Future<void> saveUserSignUp({
    required String userName,
    required String userEmail,
    required String userPassword,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
    await prefs.setString('userEmail', userEmail);
    await prefs.setString('userPassword', userPassword);
  }

  Future<void> saveUserLogIn({
    required String userEmail,
    required String userPassword,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', userEmail);
    await prefs.setString('userPassword', userPassword);
  }

  Future<void> saveUserNewPassword(String newUserPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('newUserPassword', newUserPassword);
  }

  Future<void> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }
}
