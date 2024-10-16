import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/about_app.dart';
import 'package:laza_mashro3/screens/address_screen.dart';
import 'package:laza_mashro3/screens/category_items.dart';
import 'package:laza_mashro3/screens/review_screen.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/theme_color/themes_provider.dart';
import 'package:laza_mashro3/screens/privacy_policy.dart';
import 'package:provider/provider.dart';
//drawer

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(
                "UserName",
              ),
              subtitle: Text("mera@gmail.com"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.light_mode_outlined,
                  color: mainColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
                  style: const TextStyle(fontSize: 15),
                ),
                const Spacer(),
                Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                  activeColor: mainColor,
                  activeTrackColor: white,
                )
              ],
            ),
            Roow(
              icoon: Icons.card_giftcard,
              txt: "Order",
              widgetName: AboutApp(),
            ),
            Roow(
              icoon: Icons.privacy_tip_outlined,
              txt: "Privacy & Policy",
              widgetName: const PrivacyPolicy(),
            ),
            Roow(
              icoon: Icons.info_outline,
              txt: "About App",
              widgetName: AboutApp(),
            ),
            Roow(
              icoon: Icons.logout,
              txt: "Logout",
              widgetName: AddressScreen(),
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        ));
  }
}

class Roow extends StatelessWidget {
  final IconData icoon;
  final String txt;
  final Widget widgetName;

  const Roow(
      {super.key,
      required this.icoon,
      required this.txt,
      required this.widgetName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => widgetName));
        },
        child: Row(
          children: [
            Icon(
              icoon,
              color: mainColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              txt,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
