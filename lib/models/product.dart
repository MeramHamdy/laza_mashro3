
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String title;
  final List<String> images;
  final double price;
  final String category;
  final String description;

//constructor
  Product({required this.title, required this.images, required this.price,required this.category,required this.description});
  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
}
