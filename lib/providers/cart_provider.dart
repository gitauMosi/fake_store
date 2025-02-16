import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/cart_model.dart';

class CartProvider extends StateNotifier<CartModel> {
  CartModel cartmodel;
  CartProvider(this.cartmodel)
      : super(CartModel(
            product: cartmodel.product,
            quantity: cartmodel.quantity,
            subprice: cartmodel.subprice));

  void incrementQuantity() {
    state = state.copyWith(quantity: state.quantity! + 1);
  }

  void decrementQuantity() {
    if(state.quantity! > 0){
      state = state.copyWith(quantity: state.quantity! - 1);
    }
  }

  void updateSubprice(double newSubprice) {
    state = state.copyWith(subprice: newSubprice);
  }

  
}
