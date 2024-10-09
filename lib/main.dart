import 'package:flutter/material.dart';
import 'package:laza_mashro3/address_screen.dart';
import 'package:laza_mashro3/confirm_order.dart';
import 'package:laza_mashro3/drawer_screen.dart';
import 'package:laza_mashro3/home_screen.dart';
import 'package:laza_mashro3/items.dart';
import 'package:laza_mashro3/services/product_dio.dart';
import 'package:laza_mashro3/theme_color/themes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ThemesProvider(),
    child: MyApp(),
  ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemesProvider>(context).currentTheme,

      debugShowCheckedModeBanner: false,
      home:Items(),
    );

  }
}
