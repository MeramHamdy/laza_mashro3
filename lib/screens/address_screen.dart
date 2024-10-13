import 'package:flutter/material.dart';
import 'package:laza_mashro3/screens/confirm_order.dart';
import 'package:laza_mashro3/screens/home_screen.dart';
import 'package:laza_mashro3/screens/nav_bar_screen.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/widgets/drawer_screen.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          backgroundColor: transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: CircleAvatar(
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              )),
          centerTitle: true,
          title: Text(
            'Address',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  txt: 'Name',
                  controller: nameController,
                  hint: 'Enter your Name',
                ),
                Row(children: [
                  Expanded(
                    child: TextField(
                      txt: 'Country',
                      controller: countryController,
                      hint: 'Egypt',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    txt: 'City',
                    controller: cityController,
                    hint: 'Alexandria',
                  )),
                ]),
                TextField(
                    txt: 'Phone Number',
                    controller: phoneController,
                    hint: 'Enter your phone number'),
                TextField(
                  txt: 'Address',
                  controller: addressController,
                  hint: 'Enter your address',
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 75,
            padding: EdgeInsets.only(top: 10),
            color: mainColor,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfirmOrder()));
              },
              child: Text(
                textAlign: TextAlign.center,
                "Save Address",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.w400, fontSize: 18),
              ),
            )));
  }
}

class TextField extends StatelessWidget {
  String txt;
  String hint;
  TextEditingController controller;

  TextField(
      {super.key,
      required this.txt,
      required this.controller,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          TextFormField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                hintText: hint,
                hintStyle: TextStyle(color: greyDark),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              )),
        ],
      ),
    );
  }
}
