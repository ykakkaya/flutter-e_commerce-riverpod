import 'package:ecommerce/data/products.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier() : super(productItems);

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

  void isSelectedChange(int pid, int index) {
    
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(isSelected: !state[index].isSelected)
        else
          product
    ];
  }
}

final productNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});
