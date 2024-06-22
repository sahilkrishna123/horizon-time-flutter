import 'package:firebase_database/firebase_database.dart';
import '../models/product.dart';

class ProductService {
  final DatabaseReference productRef =
      FirebaseDatabase.instance.ref().child('products');

  Future<List<Product>> getProducts() async {
    // Use await on once() to get a DatabaseEvent and then extract snapshot
    DatabaseEvent event = await productRef.once();
    DataSnapshot snapshot = event.snapshot;

    // print(snapshot.value);

    List<Product> products = [];

    if (snapshot.value != null) {
      // Handle both Map and List cases
      if (snapshot.value is Map<dynamic, dynamic>) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          products.add(Product(
            id: key,
            name: value['name'],
            description: value['description'],
            price: (value['price'] as num).toDouble(), // Ensure price is parsed as double
            imageUrl: value['imageUrl'],
            stock: value['stock'],
          ));
        });
      } else if (snapshot.value is List) {
        List<dynamic> values = snapshot.value as List<dynamic>;
        for (var i = 0; i < values.length; i++) {
          var value = values[i];
          if (value != null) {
            products.add(Product(
              id: i.toString(),
              name: value['name'],
              description: value['description'],
              price: (value['price'] as num).toDouble(), // Ensure price is parsed as double
              imageUrl: value['imageUrl'],
              stock: value['stock'],
            ));
          }
        }
      }
    }

    return products;
  }

  Future<Product> getProductById(String id) async {
    // Use await on once() to get a DatabaseEvent and then extract snapshot
    DatabaseEvent event = await productRef.child(id).once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      Map<String, dynamic> value = snapshot.value as Map<String, dynamic>;
      return Product(
        id: id,
        name: value['name'],
        description: value['description'],
        price: (value['price'] as num).toDouble(),
        imageUrl: value['imageUrl'],
        stock: value['stock'],
      );
    } else {
      throw Exception('Product not found');
    }
  }
}






// import 'package:firebase_database/firebase_database.dart';
// import '../models/product.dart';

// class ProductService {
//   final DatabaseReference productRef =
//       FirebaseDatabase.instance.ref().child('products');


//   Future<List<Product>> getProducts() async {
//     // Use await on `once()` to get a DatabaseEvent and then extract snapshot
//     DatabaseEvent event = await productRef.once();
//     DataSnapshot snapshot = event.snapshot; 

//     print(snapshot.value);



//     List<Product> products = [];

//     if (snapshot.value != null) {
//       // Ensure snapshot.value is casted correctly to Map<dynamic, dynamic>
//       Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;

//       values.forEach((key, value) {
//         products.add(Product(
//           id: key,
//           name: value['name'],
//           description: value['description'],
//           price: (value['price'] as num)
//               .toDouble(), // Ensure price is parsed as double
//           imageUrl: value['imageUrl'],
//           stock: value['stock'],
//         ));
//       });
//     }

//     return products;
//   }

//   Future<Product> getProductById(String id) async {
//     // Use await on `once()` to get a DatabaseEvent and then extract snapshot
//     DatabaseEvent event = await productRef.child(id).once();
//     DataSnapshot snapshot = event.snapshot;

//     if (snapshot.value != null) {
//       return Product.fromSnapshot(snapshot);
//     } else {
//       throw Exception('Product not found');
//     }
//   }
// }








// import 'package:firebase_database/firebase_database.dart';

// class ProductService {
//   final DatabaseReference _dbRef =
//       FirebaseDatabase.instance.ref().child('products');

//   Query getProductsQuery() {
//     return _dbRef.orderByKey(); // Example: Orders products by key
//   }
// }
