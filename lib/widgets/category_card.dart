import 'package:flutter/material.dart';

import 'package:laza_mashro3/models/product.dart';

class CategoryCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            SelectImage(product: product),

            Text(
              product.category,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectImage extends StatelessWidget {
  final Product product;

  const SelectImage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    switch (product.category) {
      case ('beauty'):
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          child: Image.asset(
            'assets/beauty.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 145,
          ),
        );
      case ('fragrances'):
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          child: Image.asset(
            'assets/Parfums.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 145,
          ),
        );
      case ('furniture'):
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          child: Image.asset(
            'assets/furniture.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 145,
          ),
        );
      case ('groceries'):
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          child: Image.asset(
            'assets/gorcerise.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 145,
          ),
        );

      default:
        return const Center(
          child: Text("No ratinng"),
        );
    }
  }
}
