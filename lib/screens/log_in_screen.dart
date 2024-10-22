import 'package:flutter/material.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/authentication_model.dart';
import 'package:laza_mashro3/models/info_shared_preferences.dart';
import 'package:laza_mashro3/screens/email_forget_password.dart';
import 'package:laza_mashro3/screens/nav_bar_screen.dart';
import 'package:laza_mashro3/screens/sign_up_screen.dart';
import 'package:laza_mashro3/services/log_in_service.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/custom_text_form_field_widget.dart';
import 'package:laza_mashro3/widgets/custom_text_widget.dart';
import 'package:laza_mashro3/widgets/password_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController gmail = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn ) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Text
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Please enter your data to continue",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  CustomTextFormField(
                    hintText: 'your email',
                    preIcon: Icons.email,
                    myController: gmail,
                    errorText: 'Please Enter your email',
                  ),
                  PasswordField(
                    myController: pass,
                    errText: "Please enter your password",
                    hintText: "password",
                  ),
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EmailOfForgetPasswordView();
                        }));
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 220,
                  ),
                  CustomText(
                    firstText: 'Don\'t have an account?',
                    secondText: 'Sign Up',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    },
                  ),
                ],
              ),
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
                //  Navigator.push(context, MaterialPageRoute(builder: (context) {
                //    return BottomNavBar();
                // }));
                if (formKey.currentState!.validate()) {
                  try {
                    isLoading = true;
                    setState(() {
                      isLoading = false;
                    });
                    AuthenticationModel model = await LogInService().LogIn(
                      email: gmail.text,
                      password: pass.text,
                    );
                    isLoading = false;
                    setState(() {});
                    print(model.status);
                    print(model.message);
                    if (model.status == 'success') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BottomNavBar();
                      }));
                      await UserInfo().saveUserLogIn(
                        userEmail: gmail.text,
                        userPassword: pass.text,
                      );
                    } else if (model.status == 'failure') {
                      showSnackBar(context, model.message);
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                }
              },
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )));
  }
}
