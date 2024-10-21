import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class PasswordField extends StatefulWidget {
  TextEditingController? myController = TextEditingController();
  String? errText, hintText;
  PasswordField({
    super.key,
    @required this.errText,
    required this.hintText,
    @required this.myController,
  });
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        obscureText: visible,
        controller: widget.myController,
        validator: (data) {
          if (data == null || data.isEmpty) {
            return widget.errText;
          }
          //  else if (data.length < 8 && hintText == 'password') {
          //   return "at least 8 characters";
          // }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          // if(preIcon != null)
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          ),
          hintText: widget.hintText,
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
