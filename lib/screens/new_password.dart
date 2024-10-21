import 'package:flutter/material.dart';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/authentication_model.dart';
import 'package:laza_mashro3/screens/log_in_screen.dart';
import 'package:laza_mashro3/services/update_password_service.dart';
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Create New Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/download.png',
                  height: 190,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 440,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Please Enter New Password',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        PasswordField(
                          errText: 'Please enter your new password',
                          myController: password,
                          hintText: "new Password",
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomButton(
                                text: 'confirm',
                                onTap: () async {
                                  String url = baseUrl + "updatepass.php";

                                  if (formKey.currentState!.validate()) {
                                    try {
                                      AuthenticationModel model =
                                          await UpdatePasswordService()
                                              .updatePassword(
                                                  newPassword: password.text,
                                                  email: widget.gmail,
                                                  url: baseUrl +
                                                      "updatepass.php");

                                      if (model.status == 'success') {
                                        showSnackBar(context,
                                            'password changed successfully');
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginPage();
                                        }));
                                      } else if (model.status == 'failure') {
                                        showSnackBar(
                                            context, 'Email not found');
                                      }
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  }
                                }),
                            const SizedBox(
                              width: 15,
                            ),
                            CustomButton(
                                text: 'Cancel',
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }));
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
