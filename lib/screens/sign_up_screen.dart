import 'package:flutter/material.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/authentication_model.dart';
import 'package:laza_mashro3/screens/log_in_screen.dart';
import 'package:laza_mashro3/screens/nav_bar_screen.dart';
import 'package:laza_mashro3/services/sign_up_service.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          },
        ),
      ),
      body: Padding(
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
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 120),
              // Username TextField
              TextField(
                controller: userName,
                decoration: InputDecoration(
                  labelText: 'Username',
                  // hintText: 'Esther Howard',
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
                  // hintText: 'HJ@#9783kja',
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
              // Email Address TextField
              TextField(
                controller: gmail,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  // hintText: 'bill.sanders@example.com',
                  // suffixIcon: Icon(Icons.check, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Remember me switch
              Row(
                children: [
                  Text('Remember me'),
                  Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      if (value) {
                        setState(() {
                          activeColor:
                          Colors.green;
                        });
                      }
                    },
                  ),
                ],
              ),
              Spacer(),
              // Sign Up Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // primary: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BottomNavBar();
                  }));
                  if (formKey.currentState!.validate()) {
                    // showSnackBar(context, 'Failed to connect with api');
                    try {
                      AuthenticationModel model = await SignUpService().SignUp(
                        userName: userName.text,
                        gmail: gmail.text,
                        pass: pass.text,
                      );
                      if (model.status == 'success') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BottomNavBar();
                        }));
                      } else if (model.message == 'Email already exists') {
                        showSnackBar(context, 'Email already exists');
                      } else if (model.message ==
                          'Failed to send verification code') {
                        showSnackBar(context,
                            'Failed to send verification code, no connection');
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
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
