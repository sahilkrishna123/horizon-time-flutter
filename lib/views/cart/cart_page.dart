import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/cart_service.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartService = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: ListView.builder(
        itemCount: cartService.cart.items.length,
        itemBuilder: (context, index) {
          final item = cartService.cart.items[index];
          return ListTile(
            title: Text(item.product.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Text('\$${item.product.price * item.quantity}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
            child: Text('Proceed to Checkout (\$${cartService.cart.totalPrice})'),
          ),
        ),
      ),
    );
  }
}
