import 'dart:convert';

// To parse this JSON data, do
//
//     final productData = productDataFromJson(jsonString);

ProductData productDataFromJson(String str) => ProductData.fromJson(json.decode(str));

String productDataToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  String status;
  String message;
  List<Product> products;

  ProductData({
    required this.status,
    required this.message,
    required this.products,
  });

  ProductData copyWith({
    String? status,
    String? message,
    List<Product>? products,
  }) =>
      ProductData(
        status: status ?? this.status,
        message: message ?? this.message,
        products: products ?? this.products,
      );

  // Factory constructor to handle JSON deserialization
  factory ProductData.fromJson(Map<String, dynamic> json) {
    // Add checks in case the JSON keys are not available
    return ProductData(
      status: json["status"] ?? '',
      message: json["message"] ?? '',
      products: json["products"] != null
          ? List<Product>.from(json["products"].map((x) => Product.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String title;
  String image;
  int price;
  String description;
  String brand;
  String model;
  String color;
  String category;
  int discount;
  bool? popular;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
    required this.model,
    required this.color,
    required this.category,
    required this.discount,
    this.popular,
  });

  Product copyWith({
    int? id,
    String? title,
    String? image,
    int? price,
    String? description,
    String? brand,
    String? model,
    String? color,
    String? category,
    int? discount,
    bool? popular,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        price: price ?? this.price,
        description: description ?? this.description,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        color: color ?? this.color,
        category: category ?? this.category,
        discount: discount ?? this.discount,
        popular: popular ?? this.popular,
      );

  // Factory constructor to handle JSON deserialization
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      image: json["image"] ?? '',
      price: json["price"] ?? 0,
      description: json["description"] ?? '',
      brand: json["brand"] ?? '',
      model: json["model"] ?? '',
      color: json["color"] ?? '',
      category: json["category"] ?? '',
      discount: json["discount"] ?? 0,
      popular: json["popular"], // Nullable field, no default value
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "description": description,
        "brand": brand,
        "model": model,
        "color": color,
        "category": category,
        "discount": discount,
        "popular": popular,
      };
}
