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
      for (final product in state)
        if (product.pid != pid) product
    ];
  }

  void increamentproductQty(int id) {
    state = [
      for (final product in state)
        if (product.pid == id)
          product.copyWith(qty: product.qty += 1)
        else
          product
    ];
  }

  void decreamentproductQty(int id) {
    state = [
      for (final product in state)
        if (product.pid == id)
          product.copyWith(qty: product.qty -= 1)
        else
          product
    ];
  }

  double cartTotalPrice() {
    double totalPrice = 0;
    for (final product in state) {
      totalPrice += product.price * product.qty;
    }
    return totalPrice;
  }
}

final cartProductNotifier =
    StateNotifierProvider<CartProductNotifier, List<ProductModel>>(
        (ref) => CartProductNotifier());
