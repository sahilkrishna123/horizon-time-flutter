import 'package:horizon_time/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart {
  List<CartItem> items = [];

  double get totalPrice => items.fold(
      0, (total, item) => total + item.product.price * item.quantity);

  void addItem(Product product) {
    // add item to cart logic
  }

  void removeItem(Product product) {
    // remove item from cart logic
  }
}
