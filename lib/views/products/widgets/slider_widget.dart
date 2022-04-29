import 'package:flutter/material.dart';

import '../../../controller/product_controller.dart';

class CustomSlider extends StatelessWidget {
  final String? title;
  final String? name;
  final ProductController? productController;
  final double? controllerValue;
  const CustomSlider({
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
          width: 75,
          child: Text(
            title ?? 'Empty',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: (controllerValue == null) ? 0 : controllerValue!,
            min: 0,
            max: 25,
            divisions: 10,
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            onChanged: (value) {
              productController!.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
      ],
    );
  }
}
