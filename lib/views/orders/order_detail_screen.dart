// lib/views/orders/order_detail_screen.dart
import 'package:flutter/material.dart';
import '../../models/order.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  OrderDetailScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.id}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Date: ${order.date}', style: TextStyle(fontSize: 16)),
            Text('Total: \$${order.totalAmount}', style: TextStyle(fontSize: 16)),
            Text('Status: ${order.status}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Items:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  var item = order.items[index];
                  return ListTile(
                    leading: Text('${item.quantity}x'),
                    title: Text(item.name),
                    trailing: Text('\$${item.total}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
