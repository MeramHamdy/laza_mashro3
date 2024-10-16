import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/models/product_model.dart';
import 'package:laza_mashro3/screens/product_screen.dart';
import 'package:laza_mashro3/services/product_service.dart';
import 'package:laza_mashro3/widgets/category_widget.dart';
import 'package:provider/provider.dart';
import '../theme_color/Colors.dart';

class CategoryItems extends StatefulWidget {
  final String category;

  const CategoryItems({super.key, required this.category});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    switch (widget.category.toLowerCase()) {
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
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
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
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
          ],
        ),
        body: Provider<ProductCubit>(
            create: (_) => ProductCubit(),
            builder: (context, child) {
              return BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: mainColor,
                  ));
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                } else if (state is ProductLoaded) {
                  // Filter products based on the category
                  List<Product> filteredProducts;
                  if (widget.category.toLowerCase() == 'beauty' ||
                      widget.category.toLowerCase() == 'fragrances' ||
                      widget.category.toLowerCase() == 'furniture' ||
                      widget.category.toLowerCase() == 'groceries') {
                    filteredProducts = state.products
                        .where((product) =>
                            product.category.toLowerCase() ==
                            widget.category.toLowerCase())
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
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const Text(
                            'Available in stock',
                            style: TextStyle(color: greyDark, fontSize: 15),
                          ),
                          Expanded(
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  padding: const EdgeInsets.all(5),
                                  children: List.generate(
                                      filteredProducts.length, (index) {
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
                                  })))
                        ]),
                  );
                } else {
                  return const Center(child: Text('No Products Found'));
                }
              });
            }));
  }
}
