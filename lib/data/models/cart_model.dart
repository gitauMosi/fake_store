// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'product_model.dart';

class CartModel {
  Product product;
  int quantity;

  CartModel({
    required this.product,
     this.quantity = 1
  });

  CartModel copyWith({Product? product, int? quantity,}) {
    return CartModel(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity
    );
  }
}
