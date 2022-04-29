import 'package:e_commerce_admin_panel/controller/product_controller.dart';
import 'package:e_commerce_admin_panel/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel? productModel;
  final int? index;
  ProductCardWidget({
    Key? key,
    this.productModel,
    this.index,
  }) : super(key: key);

  final ProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productModel!.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productModel!.description,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    productModel!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Slider(
                            onChanged: (value) {
                              controller.updatePrice(
                                index!,
                                productModel!,
                                value,
                              );
                            },
                            onChangeEnd: (value) {
                              controller.saveNewPrice(
                                  productModel!, 'price', value);
                            },
                            value: productModel!.price,
                            min: 0,
                            max: 25,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black12,
                          ),
                          Text(
                            '\$${productModel!.price.toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Qty.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Slider(
                            onChanged: (value) {
                              controller.updateQuantity(
                                index!,
                                productModel!,
                                value.toInt(),
                              );
                            },
                            onChangeEnd: (value) {
                              controller.saveNewQuantity(
                                productModel!,
                                'quantity',
                                value.toInt(),
                              );
                            },
                            value: productModel!.quantity.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black12,
                          ),
                          Text(
                            '\$${productModel!.quantity.toInt()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
