import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/widgets/category_widget.dart';
import 'package:provider/provider.dart';
import '../theme_color/Colors.dart';

class CategoryItems extends StatelessWidget {
  final String category;

  const CategoryItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    switch (category.toLowerCase()) {
      case 'beauty':
        appBarTitle = 'Beauty';
        break;
      case 'fragrances':
        appBarTitle = 'Fragrances';
        break;
      case 'furniture':
        appBarTitle = 'Furniture';
        break;
      case 'groceries':
        appBarTitle = 'Groceries';
        break;
      default:
        appBarTitle = 'All Products';
    }
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
                  color: Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              )),
          title: Text(
            appBarTitle,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                )),
          ],
        ),
        body: Provider<ProductCubit>(
            create: (_) => ProductCubit(),
            builder: (context, child) {
              return BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: mainColor,
                  ));
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                } else if (state is ProductLoaded) {
                  // Filter products based on the category
                  List<Product> filteredProducts;
                  if (category.toLowerCase() == 'beauty' ||
                      category.toLowerCase() == 'fragrances' ||
                      category.toLowerCase() == 'furniture' ||
                      category.toLowerCase() == 'groceries') {
                    filteredProducts = state.products
                        .where((product) =>
                            product.category.toLowerCase() ==
                            category.toLowerCase())
                        .toList();
                  } else {
                    // If category doesn't match specific ones, show all products
                    filteredProducts = state.products;
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${filteredProducts.length} Products',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'Available in stock',
                            style: TextStyle(color: greyDark, fontSize: 15),
                          ),
                          Expanded(
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  padding: EdgeInsets.all(5),
                                  children: List.generate(
                                      filteredProducts.length, (index) {
                                    final product = filteredProducts[index];
                                    return CategrayWidget(
                                        product: product, onTap: () {});
                                  })))
                        ]),
                  );
                } else {
                  return Center(child: Text('No Products Found'));
                }
              });
            }));
  }
}
