import 'package:e_commerce_admin_panel/views/products/new_product_view.dart';
import 'package:e_commerce_admin_panel/views/products/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';
import '../../shared/custom_app_bar.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: 'Products',
          isLeading: true,
        ),
      ),
      backgroundColor: Colors.grey[200],
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
