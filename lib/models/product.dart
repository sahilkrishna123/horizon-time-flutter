// lib/models/product.dart
import 'package:firebase_database/firebase_database.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stock,
  });

  factory Product.fromSnapshot(DataSnapshot snapshot) {
  // Check if snapshot.value is not null and cast it to Map<dynamic, dynamic>
  Map<dynamic, dynamic>? data = snapshot.value as Map<dynamic, dynamic>?;

  if (data == null) {
    throw ArgumentError('Invalid snapshot data: ${snapshot.value}');
  }

  return Product(
    id: snapshot.key!,
    name: data['name'],
    description: data['description'],
    price: (data['price'] as num).toDouble(), // Ensure price is parsed as double
    imageUrl: data['imageUrl'],
    stock: data['stock'],
  );
}

}
