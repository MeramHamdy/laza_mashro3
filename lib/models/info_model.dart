import 'dart:developer';
import 'package:laza_mashro3/models/info_shared_preferences.dart';

class InfoModel {
  static String? userName, userEmail;

  Future<void> info() async {
    userName = await UserInfo().getUserName();
    userEmail = await UserInfo().getUserEmail();
    log(userEmail ?? 'No email');
  }
}
