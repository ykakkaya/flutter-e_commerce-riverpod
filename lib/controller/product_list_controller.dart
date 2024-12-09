import 'package:ecommerce/data/products.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier() : super(productItems);
}

final productNotifierProvider = StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});
