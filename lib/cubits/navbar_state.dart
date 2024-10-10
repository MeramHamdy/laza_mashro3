// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipe_app/project/screens/cart_screen.dart';
// import 'package:recipe_app/project/screens/home_screen.dart';
part of 'navbar_cuibt.dart';



 class NavBarState extends Equatable {
    final NavbarItem navbarItem;
   final int index;


  NavBarState(this.navbarItem, this.index);

  @override
  List<Object> get props => [this.navbarItem, this.index];
}

enum NavbarItem {
  home,cart,wallet
}




