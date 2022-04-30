import 'package:e_commerce_admin_panel/views/orders/orders_view.dart';
import 'package:e_commerce_admin_panel/views/products/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: 'Toprak Commerce',
          isLeading: false,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _homeCard('Go to Products', () {
              Get.to(() => ProductView());
            }),
            const SizedBox(
              height: 20,
            ),
            _homeCard('Go to Orders', () {
              Get.to(() => OrdersView());
            }),
          ],
        ),
      ),
    );
  }

  SizedBox _homeCard(String title, void Function() onTap) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
