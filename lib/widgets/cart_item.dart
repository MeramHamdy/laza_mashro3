import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;

  CartItem({
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(price),
                ],
              ),
            ),
            // IconButton(
            //   icon: Icon(Icons.remove_circle_outline),
            //   onPressed: () {
            //     // Decrease quantity
            //   },
            // ),
            // Text('1'),
            // IconButton(
            //   icon: Icon(Icons.add_circle_outline),
            //   onPressed: () {
            //     // Increase quantity
            //   },
            // ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
