class ProductModel {
  final int id;
  final String title;
  final List<String> images;
  final double price;
  final double rating;
  final List<ReviewModel> reviews;
  final String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
    );
  }
}

class ReviewModel {
  final double rating;
  final String comment;
  final String date;
  final String reviewerName;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      date: json['date'] as String,
      reviewerName: json['reviewerName'] as String,
    );
  }
}
