
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String title;
  final List<String> images;
  final double price;
  final String category;

//constructor
  Product({required this.title, required this.images, required this.price,required this.category});
  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
}
