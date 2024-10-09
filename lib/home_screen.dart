import 'package:flutter/material.dart';
import 'package:laza_mashro3/categray.dart';
import 'package:laza_mashro3/drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>DrawerScreen()));

            },
            icon: CircleAvatar(child: Icon(Icons.menu,color: Colors.black,),backgroundColor: Colors.grey.shade300,)),
        title: Text("Nike",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
              onPressed: (){},
              icon:  CircleAvatar(child: Icon(Icons.shopping_bag_outlined,color: Colors.black,),backgroundColor: Colors.grey.shade300,)),        ],
      ),
    );
  }
}
