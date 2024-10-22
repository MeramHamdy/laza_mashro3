import 'package:flutter/material.dart';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/authentication_model.dart';
import 'package:laza_mashro3/screens/log_in_screen.dart';
import 'package:laza_mashro3/screens/verification_code.dart';
import 'package:laza_mashro3/services/update_password_service.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/custom_button_widget.dart';
import 'package:laza_mashro3/widgets/password_field.dart';

class NewPasswordView extends StatefulWidget {
  String gmail;
  NewPasswordView({
    super.key,
    required this.gmail,
  });
  static String id = 'ForgetPasswordView';

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/forget password.png',
                  height: 210,
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      PasswordField(
                        errText: 'Please enter your new password',
                        myController: password,
                        hintText: "new Password",
                      ),
                      const SizedBox(
                        height: 180,
                      ),
                      Text(
                        "Please write your new password",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 75,
          padding: const EdgeInsets.only(top: 10),
          color: mainColor,
          child: GestureDetector(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                try {
                  AuthenticationModel model = await UpdatePasswordService()
                      .updatePassword(
                      newPassword: password.text,
                      email: widget.gmail,
                      url: baseUrl + "updatepass.php");

                  if (model.status == 'success') {
                    showSnackBar(context, 'password changed successfully');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                  } else if (model.status == 'failure') {
                    showSnackBar(context, 'Email not found');
                  }
                } catch (e) {
                  print(e.toString());
                }
              }
            },
            child: Text(
              'Reset Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ));
  }
}
