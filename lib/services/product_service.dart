import 'package:laza_mashro3/helper/api.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/models/product_model.dart';

class ProductService {
  Future<Product> productInfo({
    required int productId,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: 'https://dummyjson.com/products/$productId',
    );

    return Product.fromJson(data);
  }
}
