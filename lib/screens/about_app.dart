import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/about_privacy.dart';

class AboutApp extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      "image": "assets/meram.jpg",
      "name": "Meram Hamdy",
      "job": "Mobile Developer",
    },
    {
      "image": "assets/toka.jpg",
      "name": "Toka Gamal",
      "job": "Mobile Developer",
    },
    {
      "image": "assets/yasmin.jpg",
      "name": "Yasmine Hosny",
      "job": "Mobile Developer",
    },
  ];

  AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutPrivacy(
        screenName: 'AboutApp',
        txt1: "Welcome to Laza\n\n",
        txt2:
            "Your ultimate e-commerce destination for beauty products, fragrances, furniture, and groceries.\n\n"
            "Our app offers a seamless shopping experience, allowing you to explore a diverse range of high-quality items from the comfort of your home. We focus on community and encourage users to share their experiences by adding reviews and ratings for each product. This helps you make informed decisions.\n\n"
            "Enjoy a straightforward checkout process with our cash-only payment option, ensuring a secure and efficient transaction every time. Join us and discover the convenience of shopping for all your favorite essentials in one place!",
        addTeam: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Team",
                style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
              shrinkWrap: true,
              children: List.generate(
                3,
                (index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: bgscreen1,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          data[index]["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 120,
                        ),
                        const SizedBox(height: 8),
                        //!  to It cannot be empty // if empty show red screen &exception
                        Text(
                          data[index]["name"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(data[index]["job"]!),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Thank you for choosing Laza',
              style: TextStyle(
                  color: mainColor,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
