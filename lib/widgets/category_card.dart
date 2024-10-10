import 'package:flutter/material.dart';

import 'package:laza_mashro3/models/product.dart';

class CategotyCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const CategotyCard({super.key,required this.product,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFF5F6FA),
      child:  Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          product.category,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
