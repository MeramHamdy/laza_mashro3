import 'package:flutter/cupertino.dart';
import 'package:laza_mashro3/models/product.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({required this.products});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
