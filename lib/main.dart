import 'package:e_commerce_admin_panel/views/orders/orders_view.dart';
import 'package:e_commerce_admin_panel/views/products/new_product_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home/home_view.dart';
import 'views/products/product_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Toprak Commerce Admins',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
      getPages: [
        GetPage(
          name: '/products',
          page: () => ProductView(),
        ),
        GetPage(
          name: '/products/new',
          page: () => NewProductView(),
        ),
        GetPage(
          name: '/orders',
          page: () => OrdersView(),
        ),
      ],
    );
  }
}
