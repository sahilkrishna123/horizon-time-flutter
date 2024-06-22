import 'package:firebase_database/firebase_database.dart';
import 'package:horizon_time/models/product.dart';

// Function to push dummy products to Firebase Realtime Database
void pushDummyProductsToFirebase() {
  DatabaseReference productsRef =
      FirebaseDatabase.instance.ref().child('products');

  getDummyProducts.forEach((product) {
    productsRef.child(product.id).set(product.toMap()).then((_) {
      print('Dummy product ${product.id} added successfully to Firebase');
    }).catchError((error) {
      print('Failed to add dummy product ${product.id} to Firebase: $error');
    });
  });
}

// List<Product> dummyProducts = [
//   Product(
//     id: '1',
//     name: 'Product 1',
//     description: 'Description of Product 1',
//     price: 19.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '2',
//     name: 'Product 2',
//     description: 'Description of Product 2',
//     price: 29.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '3',
//     name: 'Product 3',
//     description: 'Description of Product 3',
//     price: 39.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '4',
//     name: 'Product 4',
//     description: 'Description of Product 4',
//     price: 49.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '5',
//     name: 'Product 5',
//     description: 'Description of Product 5',
//     price: 59.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '6',
//     name: 'Product 6',
//     description: 'Description of Product 6',
//     price: 69.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '7',
//     name: 'Product 7',
//     description: 'Description of Product 7',
//     price: 79.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '8',
//     name: 'Product 8',
//     description: 'Description of Product 8',
//     price: 89.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '9',
//     name: 'Product 9',
//     description: 'Description of Product 9',
//     price: 99.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
//   Product(
//     id: '10',
//     name: 'Product 10',
//     description: 'Description of Product 10',
//     price: 109.99,
//     imageUrl:
//         'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
//   ),
// ];



// Dummy products
List<Product> getDummyProducts = [
    Product(
      id: '1',
      name: 'Dummy Product 1',
      description: 'This is a dummy product description.',
      price: 19.99,
      imageUrl:
          'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
      stock: 10,
    ),
    Product(
      id: '2',
      name: 'Dummy Product 2',
      description: 'Another dummy product description.',
      price: 29.99,
      imageUrl:
          'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
      stock: 15,
    ),
    Product(
      id: '3',
      name: 'Dummy Product 3',
      description: 'Yet another dummy product description.',
      price: 39.99,
      imageUrl:
          'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
      stock: 20,
    ),
    Product(
      id: '4',
      name: 'Dummy Product 4',
      description: 'One more dummy product description.',
      price: 49.99,
      imageUrl:
          'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
      stock: 8,
    ),
    Product(
      id: '5',
      name: 'Dummy Product 5',
      description: 'Final dummy product description.',
      price: 59.99,
      imageUrl:
          'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg',
      stock: 12,
    ),
  ];
