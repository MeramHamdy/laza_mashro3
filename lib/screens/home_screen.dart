import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/drawer_screen.dart';
import 'package:laza_mashro3/screens/category_items.dart';

import 'package:laza_mashro3/widgets/category_card.dart';

import '../theme_color/Colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.menu),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Hello',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Welcome to Laza',
                style: TextStyle(color: greyDark),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Choose category',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 500,
                child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                  if (state is ProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFE23E3E),
                      ),
                    );
                  } else if (state is ProductError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is ProductLoaded) {
                    return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          final product = state.products[index];

                          return CategotyCard(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CategoryItems(category: product.category)));

                            },
                            product: state.products[index],
                          );
                        });

                    // ListView.builder(
                    //
                    //   itemCount: state.products.length,
                    //   itemBuilder: (context, index)
                    //   {
                    //     return  CategotyCard(onTap: (){
                    //
                    //     },product: state.products[index],);
                    //   });
                  } else {
                    return Center(
                      child: Text('No Response'),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
