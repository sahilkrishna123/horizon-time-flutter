import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/cart_service.dart';
import 'services/product_service.dart';
import 'views/catalog/catalog_screen.dart';
import 'views/cart/cart_screen.dart';
import 'views/orders/orders_screen.dart';
import 'views/catalog/product_detail_screen.dart';
import 'views/cart/checkout_screen.dart';

import 'package:horizon_time/SplashScreen.dart';

import 'package:horizon_time/forgotPassword.dart';
import 'package:horizon_time/gnav.dart';
import 'package:horizon_time/home.dart';
import 'package:horizon_time/notifications.dart';
import 'package:horizon_time/signIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAQGgB0UZc7MrCVAItQsMmSTzPde1yEMNs",
        authDomain: "horizon-time.firebaseapp.com",
        projectId: "horizon-time",
        storageBucket: "horizon-time.appspot.com",
        databaseURL:
            "https://horizon-time-default-rtdb.asia-southeast1.firebasedatabase.app/",
        messagingSenderId: "487795975156",
        appId: "1:487795975156:web:b48a3c9e61ea9a3efc8fa1",
        measurementId: "G-01WMRZXLXQ",
      ),
    );
    print('Firebase successfully connected');
  } catch (e) {
    print('Error connecting to Firebase: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartService()),
        Provider<ProductService>(create: (_) => ProductService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(imageUrl: "assets/images/logo.png"),
          '/catalog': (context) => CatalogScreen(),
          '/cart': (context) => CartScreen(),
          '/orders': (context) => OrdersScreen(),
          '/signIn': (context) => signIn(),
          '/forgotPassword': (context) => forgotPassword(),
          '/gnav': (context) => gnav(),
          '/home': (context) => home(),
          '/notifications': (context) => notifications(),
          '/checkout': (context) => CheckoutScreen(),
        },
      ),
    );
  }
}
