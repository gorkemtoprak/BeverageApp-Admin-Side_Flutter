import 'package:flutter/material.dart';

import '../../../controller/product_controller.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? name;
  final ProductController? productController;
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.name,
    this.productController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController!.newProduct.update(
          name,
          (_) => value,
          ifAbsent: () => value,
        );
      },
    );
  }
}
