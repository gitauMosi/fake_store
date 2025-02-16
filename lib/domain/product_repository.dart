
import 'package:fake_store/data/services/api_services.dart';

import '../data/models/product_model.dart';

class  ProductRepository {

  ApiServices apiServices;
  ProductRepository(this.apiServices);

  Future<List<String>> getCategories() async {
    return await apiServices.getCategories();
  }

  Future<List<Product>> getProducts() async {
    return await apiServices.getProducts();
  }

  

}