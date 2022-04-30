import 'package:e_commerce_admin_panel/controller/order_controller.dart';
import 'package:e_commerce_admin_panel/models/order_model.dart';
import 'package:e_commerce_admin_panel/views/orders/widgets/orders_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/custom_app_bar.dart';

class OrdersView extends StatelessWidget {
  OrdersView({Key? key}) : super(key: key);

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: 'Orders',
          isLeading: true,
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
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: orderController.pendingOrders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrdersCardWidget(
                      orderModel: orderController.pendingOrders[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
