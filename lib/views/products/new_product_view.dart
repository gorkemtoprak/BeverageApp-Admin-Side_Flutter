import 'package:e_commerce_admin_panel/views/products/widgets/check_box_widget.dart';
import 'package:e_commerce_admin_panel/views/products/widgets/slider_widget.dart';
import 'package:e_commerce_admin_panel/views/products/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';
import '../../models/product_model.dart';
import '../../shared/custom_app_bar.dart';

class NewProductView extends StatelessWidget {
  NewProductView({Key? key}) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          title: 'Add New Products',
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
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          productController.pickImage(context);
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Add an Image',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Product Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'Product Name',
                name: 'name',
                productController: productController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hintText: 'Product Description',
                name: 'description',
                productController: productController,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                iconSize: 20,
                decoration: const InputDecoration(hintText: 'Product Category'),
                items: productController.categories.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  productController.newProduct.update(
                    'category',
                    (_) => value,
                    ifAbsent: () => value,
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomSlider(
                title: 'Price',
                name: 'price',
                productController: productController,
                controllerValue: productController.price,
              ),
              CustomSlider(
                title: 'Quantity',
                name: 'quantity',
                productController: productController,
                controllerValue: productController.quantity,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCheckBox(
                    title: 'Recommended',
                    name: 'isRecommended',
                    productController: productController,
                    controllerValue: productController.isRecommended,
                  ),
                  CustomCheckBox(
                    title: 'Popular',
                    name: 'isPopular',
                    productController: productController,
                    controllerValue: productController.isPopular,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    productController.firebaseService.addProduct(
                      ProductModel(
                        id: productController.newProduct['id'],
                        name: productController.newProduct['name'],
                        category: productController.newProduct['category'],
                        description:
                            productController.newProduct['description'],
                        imageUrl: productController.newProduct['imageUrl'],
                        isRecommended:
                            productController.newProduct['isRecommended'] ??
                                false,
                        isPopular:
                            productController.newProduct['isPopular'] ?? false,
                        price: productController.newProduct['price'],
                        quantity:
                            productController.newProduct['quantity'].toInt(),
                      ),
                    );
                    Navigator.pop(context);
                    print(productController.newProduct);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
