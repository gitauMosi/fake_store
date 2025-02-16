// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'product_model.dart';

class CartModel {
  Product product;
  int? quantity;
  double? subprice;

  CartModel({
    required this.product,
     this.quantity = 1,
     this.subprice = 0.0,
  });

  CartModel copyWith({Product? product, int? quantity, double? subprice,}) {
    return CartModel(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        subprice: subprice ?? this.subprice);
  }
}
