import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/cart_service.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartService = Provider.of<CartService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await cartService.checkout();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Order placed successfully!')),
            );
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Place Order'),
        ),
      ),
    );
  }
}
