import 'package:flutter/material.dart';

import '../../../controller/product_controller.dart';

class CustomCheckBox extends StatelessWidget {
  final String? title;
  final String? name;
  final ProductController? productController;
  final bool? controllerValue;
  const CustomCheckBox({
    Key? key,
    this.title,
    this.name,
    this.productController,
    this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {
            productController!.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
        ),
      ],
    );
  }
}
