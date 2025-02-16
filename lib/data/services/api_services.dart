import 'package:dio/dio.dart';
import 'package:fake_store/data/models/category_model.dart';

import '../models/product_model.dart';
import '../models/user_model.dart';

class ApiServices {
  final dio = Dio();
  final String baseUrl = 'https://fakestoreapi.in/api';

  // fetch all products
  Future<List<Product>> getProducts() async {
    try {
      Response response = await dio.get('$baseUrl/products');

      if (response.statusCode == 200) {
        return ProductData.fromJson(response.data).products;
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  // fetch product by id
  Future<Product> getProductById(int id) async {
    try {
      Response response = await dio.get('$baseUrl/products/$id');

      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch product');
      }
    } catch (e) {
      throw Exception('Failed to fetch product');
    }
  }

  //Get limited products
  Future<List<Product>> getLimitedProducts(int limit) async {
    try {
      Response response = await dio.get('$baseUrl/products?limit=$limit');

      if (response.statusCode == 200) {
        return ProductData.fromJson(response.data).products;
      } else {
        throw Exception('Failed to fetch limited products');
      }
    } catch (e) {
      throw Exception('Failed to fetch limited products');
    }
  }

  //Get all categories
  Future<List<String>> getCategories() async {
    try {
      Response response = await dio.get('$baseUrl/products/category');
      if (response.statusCode == 200) {
        return CategoryData.fromJson(response.data).categories;
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      throw Exception('Failed to fetch categories');
    }
  }

  //Get products of category
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      Response response =
          await dio.get('$baseUrl/products/category?type=$category');

      if (response.statusCode == 200) {
        return ProductData.fromJson(response.data).products;
      } else {
        throw Exception('Failed to fetch products by category');
      }
    } catch (e) {
      throw Exception('Failed to fetch products by category');
    }
  }

  //Add a product
  Future<bool> addProduct(Product product) async {
    String url = "$baseUrl/products";

    Map<String, dynamic> productData = {
      "title": "Apple Vision Pro",
      "brand": "Apple",
      "model": "Apple vision pro First Gen",
      "color": "Black",
      "category": "appliances",
      "discount": 1,
    };
    try {
      Response response = await dio.post(
        url,
        data: productData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      throw Exception('Failed to add product');
    }
  }

  //Update a product
  Future<bool> updateProduct(
    int id,
  ) async {
    String url = "$baseUrl/products/$id";

    Map<String, dynamic> productData = {
      "model": "Apple vision pro Second Gen",
      "color": "Blue",
      "discount": 1,
    };
    try {
      Response response = await dio.put(
        url,
        data: productData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update product');
      }
    } catch (e) {
      throw Exception('Failed to update product');
    }
  }

  //Delete a product
  Future<bool> deleteProduct(int id) async {
    String url = "$baseUrl/products/$id";

    try {
      Response response = await dio.delete(url);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      throw Exception('Failed to delete product');
    }
  }

  //Get all users
  Future<List<User>> getUsers() async {
    try {
      Response response = await dio.get('$baseUrl/users');

      if (response.statusCode == 200) {
        return UsersData.fromJson(response.data).users;
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }

  //Get single user
  Future<User> getUserById(int id) async {
    try {
      Response response = await dio.get('$baseUrl/users/$id');

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch user');
      }
    } catch (e) {
      throw Exception('Failed to fetch user');
    }
  }

  //Add a user
  Future<bool> addUser(User user) async {
    String url = '$baseUrl/users';

    try {
      Map<String, dynamic> data = {
        "email": "Thala@seven.com",
        "username": "MSDhoni",
        "password": "@2011WC",
        "name": {"firstname": "Mahendra Singh", "lastname": "Dhoni"},
        "address": {
          "city": "Rachi",
          "street": "Local Boy",
          "number": "7777777",
          "zipcode": "7777",
          "geolocation": {"lat": 77.77777, "long": 77.77777}
        },
        "phone": "777777777"
      };
      await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return true;
    } catch (e) {
      throw Exception("Error creating User");
    }
  }

  //Update user
  Future<bool> updateUser(int id, User user) async {
    String url = '$baseUrl/users/$id';
    try {
      Map<String, dynamic> data = {
        "email": "Thala@seven.com",
        "username": "MSDhoni",
        "password": "@2011WC",
        "name": {"firstname": "John ", "lastname": "Dhoni"},
        "address": {
          "city": "New york",
          "street": "Local Boy",
          "number": "7777777",
          "zipcode": "7777",
          "geolocation": {"lat": 77.77777, "long": 77.77777}
        },
        "phone": "777777777"
      };
      await dio.put(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Delete user
  Future<bool> deleteUser(int id) async {
    String url = '$baseUrl/users/$id';
    try {
      await dio.delete(url);
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}
