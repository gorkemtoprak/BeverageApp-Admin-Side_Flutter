import 'package:e_commerce_admin_panel/controller/order_controller.dart';
import 'package:e_commerce_admin_panel/models/order_model.dart';
import 'package:e_commerce_admin_panel/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrdersCardWidget extends StatelessWidget {
  final OrderModel? orderModel;
  OrdersCardWidget({Key? key, this.orderModel}) : super(key: key);

  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    var products = ProductModel.products.where((element) {
      return orderModel!.productIds.contains(element.id);
    }).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order ID: ${orderModel!.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('dd-MM-yy').format(orderModel!.createdAt),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        products[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 280,
                          child: Text(
                            ProductModel.products[index].description,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'Delivery Fee',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${orderModel!.deliveryFee}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${orderModel!.total}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                orderModel!.isAccepted
                    ? _elevatedButton(
                        'Deliver',
                        () {
                          orderController.updateOrders(
                            orderModel!,
                            'isDelivered',
                            !orderModel!.isDelivered,
                          );
                        },
                      )
                    : _elevatedButton(
                        'Accept',
                        () {
                          orderController.updateOrders(
                            orderModel!,
                            'isAccepted',
                            !orderModel!.isAccepted,
                          );
                        },
                      ),
                _elevatedButton(
                  'Cancel',
                  () {
                    orderController.updateOrders(
                      orderModel!,
                      'isCancelled',
                      !orderModel!.isCancelled,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Accept or cancel orders buttons
  ElevatedButton _elevatedButton(String title, void Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        minimumSize: const Size(150, 40),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
