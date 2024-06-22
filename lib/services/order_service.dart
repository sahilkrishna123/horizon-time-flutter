import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import '../models/order.dart' as model;
import '../services/cart_service.dart';

class OrderService {
  Future<void> placeOrder(String orderId, CartService cartService, String userId) async {
    // Create an instance of Order
    model.Order order = model.Order(
      id: orderId,
      items: cartService.items,
      totalAmount: cartService.totalAmount,
      date: DateTime.now(),
      userId: userId,
      status: 'Pending',
    );

    try {
      // Save the order to Firestore
      await firestore.FirebaseFirestore.instance.collection('orders').doc(orderId).set(order.toMap());
    } catch (e) {
      // Handle any errors that occur during Firestore operation
      print('Error placing order: $e');
      throw Exception('Failed to place order');
    }
  }

  Future<List<model.Order>> getOrdersByUserId(String userId) async {
    try {
      var querySnapshot = await firestore.FirebaseFirestore.instance
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .get();

      // Convert QuerySnapshot to List<Order>
      List<model.Order> orders = querySnapshot.docs.map((doc) => model.Order.fromFirestore(doc)).toList();
      
      return orders;
    } catch (e) {
      // Handle any errors that occur during Firestore operation
      print('Error fetching orders: $e');
      throw Exception('Failed to fetch orders');
    }
  }

  // You can define more methods related to order management here
}







// // lib/services/order_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/order.dart';
// import 'package:horizon_time/models/order.dart';



// class OrderService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> placeOrder(Order order) async {
//     await _firestore.collection('orders').doc(order.id).set(order.toMap());
//   }

//   Future<List<Order>> getOrdersByUserId(String userId) async {
//     QuerySnapshot snapshot = await _firestore
//         .collection('orders')
//         .where('userId', isEqualTo: userId)
//         .get();
//     return snapshot.docs.map((doc) => Order.fromMap(doc.data())).toList();
//   }
// }
