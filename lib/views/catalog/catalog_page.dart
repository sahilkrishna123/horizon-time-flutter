import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:provider/provider.dart';
import '../../services/product_service.dart';
import '../../models/product.dart';
import 'package:horizon_time/views/catalog/product_detail_page.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: FirebaseAnimatedList(
        query: productService.getProductsQuery(),
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          final productData = snapshot.value as Map<dynamic, dynamic>;
          final product = Product(
            id: snapshot.key.toString(),
            name: productData['name'] ?? '',
            description: productData['description'] ?? '',
            price: (productData['price'] ?? 0.0).toDouble(),
            imageUrl: productData['imageUrl'] ?? '',
          );

          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



