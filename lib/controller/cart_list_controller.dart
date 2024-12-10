import 'package:ecommerce/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductModel> cartProductList=[];

class CartProductNotifier extends StateNotifier <List<ProductModel>>{
  CartProductNotifier():super(cartProductList);

 

}