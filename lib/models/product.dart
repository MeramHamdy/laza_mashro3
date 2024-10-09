
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String title;
  final List<String> images;
  final double price;

//constructor
  Product({required this.title, required this.images, required this.price});
  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
}
