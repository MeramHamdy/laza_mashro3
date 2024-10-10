import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/home_screen.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()));
              },
              icon: CircleAvatar(
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
                backgroundColor: greyLight,
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
                  color: black, fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Text(
              'Your order has been confirmed, we will send you confirmation email shortly.',
              style: TextStyle(color: greyDark, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()));

              },
              child: Text(
                'Go to Orders',
                style: TextStyle(color: greyDark, fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: greyLight,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size(335, 50)),
            ),
            SizedBox(height: 25,)
          ],
        ),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 75,
            padding: EdgeInsets.only(top: 10),
            color: mainColor,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text(
                textAlign: TextAlign.center,
                "Continue Shopping",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.w400, fontSize: 18),
              ),
            )));
  }
}
