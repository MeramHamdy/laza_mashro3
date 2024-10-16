import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class AboutPrivacy extends StatelessWidget {
  final String screenName;
  final String txt1;
  final String txt2;
  final Widget? addTeam;

  const AboutPrivacy(
      {super.key,
      required this.screenName,
      required this.txt1,
      required this.txt2,
      required this.addTeam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: greyLight,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                mainColor,
                bgscreen1,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        title: Text(
          screenName,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: txt1,
                      style: const TextStyle(
                          color: mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: txt2,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              if (addTeam != null) ...[
                const SizedBox(height: 30),
                addTeam!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
