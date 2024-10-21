import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData preIcon;
  TextEditingController? myController = TextEditingController();
  String? errorText;
  TextInputType? typeData;

  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.preIcon,
    @required this.typeData,
    @required this.myController,
    @required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        controller: myController,
        validator: (data) {
          if (data == null || data.isEmpty) {
            return errorText;
          } else if (!data.contains('@gmail.com') &&
              !EmailValidator.validate(data) &&
              hintText == 'email') {
            return "Please enter a valid email";
          }

          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          prefixIcon: Icon(
            preIcon,
            color: mainColor,
          ),
          // if(preIcon != null)
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black26,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: mainColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
