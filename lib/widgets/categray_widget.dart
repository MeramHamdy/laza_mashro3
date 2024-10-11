import 'package:flutter/material.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class CategrayWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const CategrayWidget({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: white, // Different color for each item
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              Text(product.title),
              Text('${product.price.toString()}\$'),
            ],
          ),
        ),
      ),
    );
  }
}
