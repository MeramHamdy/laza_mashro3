import 'package:flutter/material.dart';
import 'package:laza_mashro3/models/info_model.dart';
import 'package:laza_mashro3/screens/about_app.dart';
import 'package:laza_mashro3/screens/cart_screen.dart';
import 'package:laza_mashro3/screens/log_in_screen.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/theme_color/themes_provider.dart';
import 'package:laza_mashro3/screens/privacy_policy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
             ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(
                InfoModel.userName ?? "User Name" ,
              ),
              subtitle: Text(InfoModel.userEmail ?? "user@gmail.com"),
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
              widgetName: CartScreen(),
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
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.clear(); // Clear stored data

                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: mainColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
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
