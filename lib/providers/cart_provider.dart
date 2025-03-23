import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/cart_model.dart';
import '../data/models/product_model.dart';

// cart provider
final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, List<CartModel>>(
        (ref) => CartNotifier());

// cart state notifier
class CartNotifier extends StateNotifier<List<CartModel>> {
  CartNotifier() : super([]);

  // Adds a product to the cart, or increments quantity if it's already in the cart
  void addCart(Product product) {
    bool isAvailable = state.any((value) => value.product.id == product.id);
    
    if (isAvailable) {
      // Update the state by creating a new list with the incremented quantity
      state = [
        ...state.map((value) {
          if (value.product.id == product.id) {
            return CartModel(product: product, quantity: value.quantity + 1);
          } else {
            return value;
          }
        })
      ];
    } else {
      // Add a new product to the cart
      state = [...state, CartModel(product: product)];
    }
  }

  // Increments the quantity of a given cart item
  void incrementQuantity(CartModel newCart) {
    state = [
      ...state.map((cart) {
        if (cart == newCart) {
          return CartModel(product: cart.product, quantity: cart.quantity + 1);
        } else {
          return cart;
        }
      })
    ];
  }

  // Decrements the quantity of a given cart item
  void decrementQuantity(CartModel newCart) {
    state = [
      ...state.map((cart) {
        if (cart == newCart && cart.quantity > 0) {
          return CartModel(product: cart.product, quantity: cart.quantity - 1);
        } else {
          return cart;
        }
      })
    ];
  }

  // Calculates the total quantity of all items in the cart
  double getTotal() {
    return state.fold(0.0, (prev, element) => prev + (element.quantity * element.product.price));
  }
}
