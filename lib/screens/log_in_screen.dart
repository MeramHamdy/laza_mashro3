import 'package:flutter/material.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/authentication_model.dart';
import 'package:laza_mashro3/screens/nav_bar_screen.dart';
import 'package:laza_mashro3/screens/sign_up_screen.dart';
import 'package:laza_mashro3/services/log_in_service.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/custom_text_widget.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPageId';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController gmail = TextEditingController();

  TextEditingController pass = TextEditingController();

  bool isLoading = false;

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
                          style:
                              TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                  // Username TextField
                  TextField(
                    controller: gmail,
                    decoration: InputDecoration(
                      labelText: 'email',
                      // suffixIcon: Icon(Icons.check, color: Colors.green),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password TextField
                  TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      // suffixIcon: Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Text(
                      //       'Strong',
                      //       style: TextStyle(color: Colors.green),
                      //     ),
                      //     Icon(Icons.check, color: Colors.green),
                      //   ],
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot password?',
                        style:
                            TextStyle(color:   mainColor,
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 220,),
                  CustomText(
                    firstText: 'Don\'t have an account?',
                    secondText: 'Sign Up',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    },
                  ),
                  // SizedBox(height: 20),
                  // // Remember me switch
                  // Row(
                  //   children: [
                  //     Text('Remember me'),
                  //     Spacer(),
                  //     Switch(
                  //       value: true,
                  //       onChanged: (value) {},
                  //       activeColor: Colors.green,
                  //     ),
                  //   ],
                  // ),

                  // Terms and conditions
                  // Center(
                  //   child: Text(
                  //     'By connecting your account confirm that you agree\nwith our Terms and Conditions',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(fontSize: 12, color: Colors.grey),
                  //   ),
                  // ),
                  // Login Button

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
    onTap: () async  {
            // future delete
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BottomNavBar();
            }));
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
        )
    )  );
  }
}
