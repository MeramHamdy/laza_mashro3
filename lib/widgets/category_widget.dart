import 'package:flutter/material.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class CategrayWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const CategrayWidget({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    product.images[0],
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${product.price.toString()}\$'),
              ],
            ),
          ),
        ));
  }
}
