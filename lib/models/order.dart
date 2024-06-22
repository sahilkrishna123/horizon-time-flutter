// lib/models/order.dart
import 'cart_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime date;
  final String userId;
  final String status;

  Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.date,
    required this.userId,
    required this.status,
  });

  factory Order.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Order(
      id: doc.id,
      items: (data['items'] as List).map((item) => CartItem.fromMap(item as Map<String, dynamic>)).toList(),
      totalAmount: data['totalAmount'],
      date: (data['date'] as Timestamp).toDate(),
      userId: data['userId'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'items': items.map((item) => item.toMap()).toList(),
      'totalAmount': totalAmount,
      'date': date,
      'userId': userId,
      'status': status,
    };
  }
}
