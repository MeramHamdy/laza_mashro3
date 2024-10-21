import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/add_review.dart';
import 'package:laza_mashro3/cubits/navbar_cuibt.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/screens/splash_screen.dart';
import 'package:laza_mashro3/services/product_dio.dart';
import 'package:laza_mashro3/theme_color/themes_provider.dart';
import 'package:provider/provider.dart';

void main() {
  ProductService().getProducts();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemesProvider>(builder: (context, themesProvider, child) {
      return MaterialApp(
        theme: themesProvider.currentTheme,
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<NavBarCubit>(
              create: (context) => NavBarCubit(),
            ),
            BlocProvider<ProductCubit>(
              create: (context) => ProductCubit(),
            ),
            BlocProvider<AddReviewCubit>(
              create: (context) => AddReviewCubit(),
            )
          ],
          child: SplashScreen(),
        ),
      );
    });
  }
}
