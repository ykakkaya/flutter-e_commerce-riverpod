import 'package:ecommerce/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductModel> cartProductList = [];

class CartProductNotifier extends StateNotifier<List<ProductModel>> {
  CartProductNotifier() : super(cartProductList);

  addCart(ProductModel product) {
    state = [...state, product];
  }

  removeCart(int pid) {
    state = [
      for(final product in state)
        if(product.pid != pid)
          product
    ];
  }
}

final cartProductNotifier =
    StateNotifierProvider<CartProductNotifier, List<ProductModel>>(
        (ref) => CartProductNotifier());
