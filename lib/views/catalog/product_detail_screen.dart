// lib/views/catalog/product_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../services/cart_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final CartService cartService = CartService();

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 16),
            Text(product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('\$${product.price}',
                style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(height: 16),
            Text(product.description),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                print("Button pressed: Adding ${product.name}");
                Provider.of<CartService>(context, listen: false)
                    .addItem(product);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Added to cart')));
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
