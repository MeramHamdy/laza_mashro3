import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/navbar_cuibt.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/screens/address_screen.dart';
import 'package:laza_mashro3/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../theme_color/Colors.dart';
import 'home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Provider<NavBarCubit>(
        create: (_) => NavBarCubit(),
    builder: (context, child) {
    return BlocBuilder<NavBarCubit, NavBarState>(builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return const HomeScreen();
        } else if (state.navbarItem == NavbarItem.cart) {
          return CartScreen();
        }
        return Container();
     });}),
      bottomNavigationBar:Provider<NavBarCubit>(
        create: (_) => NavBarCubit(),
    builder: (context, child) {
    return BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            currentIndex: state.index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  activeIcon: Text(
                    'Home',
                    style: TextStyle(
                        color: bgscreen1, fontWeight: FontWeight.w500),
                  ),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: Text('Cart',
                      style: TextStyle(
                          color: bgscreen1, fontWeight: FontWeight.w500)),
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'Cart'),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavBarCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                context.read<NavBarCubit>().getNavBarItem(NavbarItem.cart);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>CartScreen()));
              }
            });  },
          );
        },
    ),
    );
  }
}
