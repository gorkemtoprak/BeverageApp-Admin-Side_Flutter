import 'package:e_commerce_admin_panel/models/product_model.dart';
import 'package:e_commerce_admin_panel/views/products/new_product_view.dart';
import 'package:e_commerce_admin_panel/views/products/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        // automaticallyImplyLeading: false,
        title: Text(
          'Products',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => NewProductView());
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.white,
        ),
      ),
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
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 250,
                      child: ProductCardWidget(
                        productModel: controller.products[index],
                        index: index,
                      ),
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
