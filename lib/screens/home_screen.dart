import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/screens/drawer_screen.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/screens/cart_screen.dart';
import 'package:laza_mashro3/screens/category_items.dart';
import 'package:laza_mashro3/screens/product_screen.dart';
import 'package:laza_mashro3/screens/review_screen.dart';
import 'package:laza_mashro3/services/product_service.dart';

import 'package:laza_mashro3/widgets/category_card.dart';
import 'package:laza_mashro3/widgets/category_widget.dart';
import 'package:provider/provider.dart';

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
            child: IconButton(
              icon: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CartScreen()));
              },
            ),
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
                child: Provider<ProductCubit>(
    create: (_) => ProductCubit(),
    builder: (context, child) {
    return BlocBuilder<ProductCubit, ProductState>(
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
                              .where((product) =>
                              product.title
                                  .toLowerCase()
                                  .contains(searchQuery.toLowerCase()))
                              .toList();
                          return Column(
                            children: [
                              Expanded(
                                child: GridView.count(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    padding: const EdgeInsets.all(5),
                                    children:
                                    List.generate(filteredProducts.length, (index) {
                                      final product = filteredProducts[index];
                                      return CategrayWidget(
                                          product: product,
                                          onTap: () async {
                                            try {
                                              setState(() {});
                                              Product model =
                                              await ProductService()
                                                  .productInfo(
                                                  productId: product.id);
                                              setState(() {});
                                              print(model.title);
                                              print(model.id);
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                        return ProductPage(model);
                                                      }));
                                            } catch (e) {
                                              print(e.toString());
                                            }
                                          });
                                    })),
                              ),
                            ],
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
                                          builder: (context) =>
                                              CategoryItems(
                                                  category: state.products[0]
                                                      .category)
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
                                          builder: (context) =>
                                              CategoryItems(
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
                                          builder: (context) =>
                                              CategoryItems(
                                                  category:
                                                  state.products[11].category)));
                                },
                                product: state.products[11],
                                id: state.products[11].id,
                              ),
                              CategoryCard(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryItems(
                                                  category:
                                                  state.products[19]
                                                      .category)));
                                },
                                product: state.products[19],
                                id: state.products[19].id,
                              )
                            ],
                          );
                        }

                      } else {
                        return const Center(
                          child: Text('No Response'),
                        );
                      }
                    });    }),
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
