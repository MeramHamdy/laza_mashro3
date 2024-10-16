import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/drawer_screen.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/screens/category_items.dart';
import 'package:laza_mashro3/screens/review_screen.dart';

import 'package:laza_mashro3/widgets/category_card.dart';
import 'package:laza_mashro3/widgets/category_widget.dart';

import '../theme_color/Colors.dart';
//home

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";

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
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.menu),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const Drawer(
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
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Welcome to Laza',
                style: TextStyle(color: greyDark),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value
                        .toLowerCase(); // Update search query on text change
                  });
                },
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
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFE23E3E),
                      ),
                    );
                  } else if (state is ProductError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is ProductLoaded) {
                    List<Product> filteredProducts;
                    if (searchQuery.isNotEmpty) {
                      filteredProducts = state.products
                          .where((product) => product.title
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()))
                          .toList();
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            padding: const EdgeInsets.all(5),
                            children:
                                List.generate(filteredProducts.length, (index) {
                              final product = filteredProducts[index];
                              return CategrayWidget(
                                  product: product, onTap: () {});
                            })),
                      );
                    } else {
                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        children: [
                          CategoryCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryItems(
                                          category: state.products[0].category)
                                      // ReviewScreen(product: state
                                      //     .products[0])
                                      ));
                            },
                            product: state.products[0],
                            id: state.products[0].id,
                          ),
                          CategoryCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryItems(
                                          category:
                                              state.products[5].category)));
                            },
                            product: state.products[5],
                            id: state.products[5].id,
                          ),
                          CategoryCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReviewScreen(
                                          product: state.products[2])));
                            },
                            product: state.products[11],
                            id: state.products[11].id,
                          ),
                          CategoryCard(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryItems(
                                          category:
                                              state.products[19].category)));
                            },
                            product: state.products[19],
                            id: state.products[19].id,
                          )
                        ],
                      );
                    }
                    // GridView.builder(
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 2),
                    //   itemCount: state.products.length,
                    //   itemBuilder: (context, index) {
                    //        if (state.products[index].id == 1 || state.products[index].id == 6|| state.products[index].id==11 || state.products[index].id ==20) {
                    //          return CategoryCard(
                    //            onTap: () {
                    //              Navigator.push(context,
                    //                  MaterialPageRoute(
                    //                      builder: (context) =>
                    //                          ReviewScreen(product: state
                    //                              .products[index])));
                    //            },
                    //            product: state.products[index],
                    //            id: state.products[index].id,
                    //          );
                    //        }
                    //   });
                  } else {
                    return const Center(
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
// ListView.builder(
//
//   itemCount: state.products.length,
//   itemBuilder: (context, index)
//   {
//     return  CategotyCard(onTap: (){
//
//     },product: state.products[index],);
//   });
