

import 'package:fake_store/data/models/product_model.dart';
import 'package:fake_store/domain/repositories/product_repository.dart';
import 'package:fake_store/providers/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final   productRepoProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(ref.read(apiServicesProvider));
});



final allProductProvider = FutureProvider<List<Product>>((ref) {
  return ref.read(productRepoProvider).getProducts();
});

final categoriesProductProvider = FutureProvider<List<String>>((ref) {
  return ref.read(productRepoProvider).getCategories();
});