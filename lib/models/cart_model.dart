class CartModel {
  final int id;
  final String title;
  final List<String> images;
  final double price;

  CartModel({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
  });
}
