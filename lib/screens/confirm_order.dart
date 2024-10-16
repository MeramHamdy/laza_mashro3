import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/cart_screen.dart';
import 'package:laza_mashro3/screens/home_screen.dart';
import 'package:laza_mashro3/screens/nav_bar_screen.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          backgroundColor: transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>  BottomNavBar()));
              },
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/confirm1.png",
                  width: double.infinity,
                ),
                Image.asset(
                  "assets/confirm2.png",
                  width: double.infinity,
                ),
              ],
            ),
            Text(
              'Order Confirmed!',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const Text(
              'Your order has been confirmed, we will send you confirmation email shortly.',
              style: TextStyle(color: greyDark, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>  CartScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: const Size(335, 50)),
              child: Text(
                'Go to Orders',
                style: TextStyle(color: greyDark, fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 75,
            padding: const EdgeInsets.only(top: 10),
            color: mainColor,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBar()));
              },
              child: const Text(
                textAlign: TextAlign.center,
                "Continue Shopping",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.w400, fontSize: 18),
              ),
            )));
  }
}
