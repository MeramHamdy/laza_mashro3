import 'package:flutter/material.dart';

import 'theme_color/Colors.dart';
import 'home_screen.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()));

            },

            icon: CircleAvatar(child: Icon(Icons.arrow_back_outlined,color: black,),
              backgroundColor: greyLight,)),
        title: Text("Nike",style: TextStyle(color: black),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              icon:  CircleAvatar(child: Icon(Icons.card_giftcard,color: black,),
                backgroundColor: greyLight,)),        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('357 Items',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            Text('Available in stock',style: TextStyle(color: greyDark,fontSize:15 ),),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0, // Space between columns
                mainAxisSpacing: 20.0, // Space between rows
                padding: EdgeInsets.all(10),
                children: List.generate(10, (index) {
                  return Container(
                    color: white, // Different color for each item
                    child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/confirm2.png",
                            fit: BoxFit.cover,

                          ),
                        ),
                        Text('title $index'),
                        Text('price $index'),

                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
