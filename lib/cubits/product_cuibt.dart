import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/services/product_dio.dart';

class ProductCubit extends Cubit<List<Product>>{
//constructor //initial value of state is [] -->list empty
//call product service in cubit
  ProductCubit() : super([]){
    //call to data
    getProducts();
  }
// obj from prduct service

  final ProductService productService = ProductService();

  void getProducts() async{

    //handel exeption

    try{
      final result = await productService.getProducts();
      emit(result);
    }catch(e){

    }


}


}