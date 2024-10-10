library navbar_cubit;


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'navbar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavBarState(NavbarItem.home, 0));
        break;
      case NavbarItem.cart:
        emit(NavBarState(NavbarItem.cart, 1));
        break;

    }
  }
  // NavBarCubit() : super(NavbarInitial());
  // static NavBarCubit get(context) => BlocProvider.of(context);

  // int currentIndex = 0;

  // void changeBottomNavBar(int index) {
  //   currentIndex = index;
  //   switch (currentIndex) {
  //     case 0:
  //       emit(HomeState());
  //     case 1:
  //       emit(CartState());
  //   }
}
