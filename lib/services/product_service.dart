import 'package:firebase_database/firebase_database.dart';

class ProductService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('products');

  Query getProductsQuery() {
    return _dbRef.orderByKey(); // Example: Orders products by key
  }
}
