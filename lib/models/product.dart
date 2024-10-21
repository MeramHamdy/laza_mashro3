import 'package:json_annotation/json_annotation.dart';
import 'package:laza_mashro3/models/reviews.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
   String title;
  final List<String> images;
  final double price;
  final double rating;
  final List<Reviews> reviews;
  final String category;
  final String description;

//constructor
  Product({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
