import 'package:flutter/material.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:laza_mashro3/screens/new_password.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          // vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/istockphoto-1338629648-612x612.jpg',
                height: 270,
              ),
              Container(
                height: 470,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Verification Code',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Enter the code sent to your email.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      VerificationCode(
                        itemSize: 47,
                        length: 6,
                        fillColor: Colors.white,
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t receive the code ?',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Resend',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      CustomButton(
                          text: 'Verify',
                          onTap: () async {
                            // Navigator.pushNamed(context, widget.nextView!);

                            if (widget.verificationCode.toString() == code) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return NewPasswordView(
                                  gmail: widget.email!,
                                );
                              }));
                            } else if (code == null) {
                              showSnackBar(context, 'Please enter the code');
                            } else {
                              showSnackBar(context, 'Invalid code');
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
