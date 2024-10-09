import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:laza_mashro3/drawer_screen.dart';

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
        appBar: AppBar(
          backgroundColor: white,
          leading: IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: black,
                ),
                backgroundColor: greyLight,
              )),
          centerTitle: true,
          title: Text(
            'Address',
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
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
                    MaterialPageRoute(builder: (context) => DrawerScreen()));
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
                fillColor: greyLight,
                filled: true,
                hintText: hint,
                hintStyle: TextStyle(color: greyDark),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: greyLight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              )),
        ],
      ),
    );
  }
}
