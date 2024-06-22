import 'package:firebase_database/firebase_database.dart';
import '../models/cart.dart';
import '../models/product.dart';

class CartService {
  Cart _cart = Cart();
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('orders');

  Cart get cart => _cart;

  void addItemToCart(Product product) {
    _cart.addItem(product);
  }

  void removeItemFromCart(Product product) {
    _cart.removeItem(product);
  }

  Future<void> checkout() async {
    await _dbRef.push().set({
      'items': _cart.items.map((item) => {
        'productId': item.product.id,
        'quantity': item.quantity,
      }).toList(),
      'totalPrice': _cart.totalPrice,
      'timestamp': DateTime.now().toIso8601String(),
    });
    _cart = Cart(); // Reset cart after checkout
  }
}
