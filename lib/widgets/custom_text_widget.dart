import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  String? firstText, secondText;
  VoidCallback? onTap;
  CustomText({super.key, this.firstText, this.secondText, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$firstText',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 17,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            '   $secondText',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
