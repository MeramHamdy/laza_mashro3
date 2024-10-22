import 'package:flutter/material.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:laza_mashro3/screens/email_forget_password.dart';
import 'package:laza_mashro3/screens/new_password.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/custom_button_widget.dart';

class VerificationCodeView extends StatefulWidget {
  final int verificationCode;
  final String? email;

  // const VerificationCodeView.second() : verificationCode = 4;
  const VerificationCodeView({
    required this.verificationCode,
    @required this.email,
  });

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  bool onEditing = true;
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,

        appBar: AppBar(
          backgroundColor: transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EmailOfForgetPasswordView();
                }));
              },
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/forget password.png',
                  height: 270,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    VerificationCode(
                      itemSize: 47,
                      length: 6,
                      fillColor: mainColor,
                      onCompleted: (String value) {
                        setState(() {
                          code = value;
                        });
                      },
                      onEditing: (bool value) {
                        setState(() {
                          onEditing = value;
                        });
                        if (!onEditing) FocusScope.of(context).unfocus();
                      },
                    ),
                    const SizedBox(
                      height: 180,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t receive the code ?  ',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Resend',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
              if (widget.verificationCode.toString() == code) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewPasswordView(
                    gmail: widget.email!,
                  );
                }));
              } else if (code == null) {
                showSnackBar(context, 'Please enter the code');
              } else {
                showSnackBar(context, 'Invalid code');
              }
            },
            child: Text(
              'Confirm Code',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ));
  }
}
