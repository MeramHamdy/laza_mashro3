import 'package:dio/dio.dart';
import 'package:laza_mashro3/models/product.dart';

class ProductDio {
  final dio = Dio();

  Future<List<Product>> getProduct() async {
    final response = await dio.get('https://dummyjson.com/products');

//get 30 product json
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> productsJson = jsonData['products'];
//transfer to product list
    List<Product> products = productsJson
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();

    return products;
  }
}
