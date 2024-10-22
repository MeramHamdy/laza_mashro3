import 'package:flutter/material.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/authentication_model.dart';
import 'package:laza_mashro3/models/info_shared_preferences.dart';
import 'package:laza_mashro3/screens/log_in_screen.dart';
import 'package:laza_mashro3/screens/nav_bar_screen.dart';
import 'package:laza_mashro3/services/sign_up_service.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/custom_text_form_field_widget.dart';
import 'package:laza_mashro3/widgets/password_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController gmail = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkSignupStatus();
  }

  void checkSignupStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool isSignUp = prefs.getBool('isSignUp') ?? false;
    if (isLoggedIn || isSignUp) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          backgroundColor: transparent,
          elevation: 0,
          leading: IconButton(
            icon: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      "Sign Up",
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 120),
                  CustomTextFormField(
                    hintText: 'UserName',
                    preIcon: Icons.person,
                    myController: userName,
                    errorText: 'Please enter your name',
                  ),
                  CustomTextFormField(
                    hintText: 'email',
                    preIcon: Icons.email,
                    myController: gmail,
                    errorText: 'Please enter your email',
                  ),
                  PasswordField(
                    myController: pass,
                    errText: "please enter password",
                    hintText: "password",
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
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return LoginPage();
              // }));
              if (formKey.currentState!.validate()) {
                // showSnackBar(context, 'Failed to connect with api');
                try {
                  AuthenticationModel model = await SignUpService().SignUp(
                    userName: userName.text,
                    gmail: gmail.text,
                    pass: pass.text,
                    profilePicture: 'laza_mashro3-master/assets/yasmin.jpg',
                  );
                  if (model.status == 'success') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                    await UserInfo().saveUserSignUp(
                        userName: userName.text,
                        userPassword: pass.text,
                        userEmail: gmail.text);
                  } else if (model.message == 'Email already exists') {
                    showSnackBar(context, 'Email already exists');
                  }
                } catch (e) {
                  print(e.toString());
                  showSnackBar(
                      context, 'oops, there is a problem: ${e.toString()}');
                }
              }
            },
            child: Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ));
  }
}
