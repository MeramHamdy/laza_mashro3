import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/about_privacy.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutPrivacy(
      screenName: 'AboutApp',
      txt1:  "Welcome to Laza!\n\n",
      txt2:
          "Your ultimate e-commerce destination for beauty products, fragrances, furniture, and groceries.\n\n"
          "Our app offers a seamless shopping experience, allowing you to explore a diverse range of high-quality items from the comfort of your home. We focus on community and encourage users to share their experiences by adding reviews and ratings for each product. This helps you make informed decisions.\n\n"
          "Enjoy a straightforward checkout process with our cash-only payment option, ensuring a secure and efficient transaction every time. Join us and discover the convenience of shopping for all your favorite essentials in one place!",
    );
  }
}
