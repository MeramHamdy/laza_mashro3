import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/about_app.dart';
import 'package:laza_mashro3/theme_color/themes_provider.dart';
import 'package:laza_mashro3/screens/privacy_policy.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemesProvider>(context);

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.menu),
                )),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(
                "UserName",
              ),
              subtitle: Text("mera@gmail.com"),
            ),

  }
}

class Roow extends StatelessWidget {
  final IconData icoon;
  final String txt;
  final Widget widgetName;
  Roow({required this.icoon, required this.txt,required this.widgetName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:  (){  Navigator.push(context,
            MaterialPageRoute(builder: (context) => widgetName));},
        child: Row(
          children: [
            Icon(
              icoon,
              color: Colors.deepPurple,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              txt,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}