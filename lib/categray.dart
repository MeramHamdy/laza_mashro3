import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/widgets/items_widget.dart';

import 'theme_color/Colors.dart';
import 'home_screen.dart';

class Items extends StatelessWidget {
  const Items({super.key });

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
              icon:  CircleAvatar(child: Icon(Icons.shopping_bag_outlined,color: black,),
                backgroundColor: greyLight,)),        ],
      ),
      //product --> state from cubit class
      body:BlocBuilder<ProductCubit,List<Product>>(builder:(context,products){

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text('${products.length}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          Text('Available in stock',style: TextStyle(color: greyDark,fontSize:15 ),),
              Expanded(
              child: GridView.count(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10.0, // Space between columns
              mainAxisSpacing: 20.0, // Space between rows
              padding: EdgeInsets.all(10),
              children: List.generate(products.length, (index) {
          return
          CategrayWidget(product: products[index], onTap:(){});
          })))

          ]),
        );
      })
    );
  }
}
