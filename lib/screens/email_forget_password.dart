import 'package:flutter/material.dart';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/authentication_model.dart';
import 'package:laza_mashro3/screens/log_in_screen.dart';
import 'package:laza_mashro3/screens/verification_code.dart';
import 'package:laza_mashro3/services/forget_password_service.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/custom_text_form_field_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EmailOfForgetPasswordView extends StatefulWidget {
  EmailOfForgetPasswordView({
    super.key,
  });

  @override
  State<EmailOfForgetPasswordView> createState() =>
      _EmailOfForgetPasswordViewState();
}

class _EmailOfForgetPasswordViewState extends State<EmailOfForgetPasswordView> {
  final TextEditingController gmail = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiary,

          appBar: AppBar(
            backgroundColor: transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text('Forgot Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(
                      'assets/forget password.png',
                      height: 210,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        CustomTextFormField(
                            errorText: 'Your email is required',
                            myController: gmail,
                            hintText: "Your email",
                            preIcon: Icons.email_rounded),
                        const SizedBox(
                          height: 180,
                        ),
                        Text(
                          "Please write your email to receive a \n verification code to set a new password",
                          textAlign: TextAlign.center,
                        )
                      ],
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return VerificationCodeView(
                //         verificationCode: 123456,
                //         email: gmail.text,
                //       );
                //     },
                //   ),
                // );
                if (formKey.currentState!.validate()) {
                  AuthenticationModel model =
                  await ForgetPasswordService().forgetPassword(
                    email: gmail.text,
                    url: baseUrl + "forgetpassword.php",
                  );
                  emailForgetPassword(model, context);
                }
              },
              child: Text(
                'Confirm Mail',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          )),
    );
  }

  void emailForgetPassword(AuthenticationModel model, BuildContext context) {
    if (model.status == 'success') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return VerificationCodeView(
              verificationCode: model.verificationCode!,
              email: gmail.text,
            );
          },
        ),
      );
    } else if (model.message == 'Email not found') {
      showSnackBar(context, 'Email not found');
    }
  }
}
