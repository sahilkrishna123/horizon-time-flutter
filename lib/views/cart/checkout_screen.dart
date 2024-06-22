// lib/views/cart/checkout_screen.dart
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // Import here
import '../../services/cart_service.dart';
import '../../services/order_service.dart';
import '../../models/order.dart';
import '../../services/order_service.dart';
import '../../models/order.dart';
import '../../services/order_service.dart';

class CheckoutScreen extends StatelessWidget {
  final CartService cartService = CartService();
  final OrderService orderService = OrderService();
  final String userId = "sampleUserId";  // replace with actual user ID logic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text('Total: \$${cartService.totalAmount}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                var orderId = Uuid().v4();  // Correct usage here
                var order = Order(
                  id: orderId,
                  items: cartService.items,
                  totalAmount: cartService.totalAmount,
                  date: DateTime.now(),
                  userId: userId,
                  status: 'Pending',
                );
                // await orderService.placeOrder(order);
                await orderService.placeOrder(order.id, cartService, userId);

                cartService.clearCart();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order placed successfully')));
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
