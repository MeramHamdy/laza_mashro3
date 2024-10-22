import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/services/product_dio.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()) {
    getProducts();
  }

  final ProductService productService = ProductService();

  void getProducts() async {
    emit(ProductLoading());
    //handel exeption
    try {
      final result = await productService.getProducts();
      emit(ProductLoaded(products: result));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
