import 'package:dio/dio.dart';
import 'package:laza_mashro3/models/product.dart';

class ProductService {
  final _dio = Dio();

  Future<List<Product>> getProducts() async {
    final response = await _dio.get('https://dummyjson.com/products');

    Map<String, dynamic> jsonData = response.data;

    List<dynamic> productsJson = jsonData['products'];

    List<Product> products = productsJson
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();

    return products;
  }
}
