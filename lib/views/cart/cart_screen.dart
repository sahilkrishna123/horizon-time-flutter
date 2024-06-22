import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/cart_service.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: Consumer<CartService>(
        builder: (context, cartService, child) {
          return cartService.items.isEmpty
              ? Center(child: Text('Your cart is empty'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartService.items.length,
                        itemBuilder: (context, index) {
                          var item = cartService.items[index];
                          return ListTile(
                            leading: Text('${item.quantity}x'),
                            title: Text(item.name),
                            trailing: Text('\$${item.total}'),
                            onLongPress: () {
                              cartService.removeItem(item.productId);
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Total: \$${cartService.totalAmount}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CheckoutScreen()),
                              );
                            },
                            child: Text('Checkout'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

