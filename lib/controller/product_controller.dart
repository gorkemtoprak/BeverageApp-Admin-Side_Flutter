import 'package:e_commerce_admin_panel/models/product_model.dart';
import 'package:e_commerce_admin_panel/services/firebase_service.dart';
import 'package:e_commerce_admin_panel/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  //obs stands for observable
  var products = <ProductModel>[].obs;
  FirebaseService firebaseService = FirebaseService();
  ImageService imageService = ImageService();
  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  List<String> categories = [
    'Smoothies',
    'Soft Drinks',
    'Water',
  ];

  @override
  void onInit() {
    products.bindStream(firebaseService.getProducts());
    super.onInit();
  }

  void updatePrice(int index, ProductModel? product, double value) {
    product!.price = value;
    products[index] = product;
  }

  void saveNewPrice(ProductModel product, String field, double value) {
    firebaseService.updateProduct(product, field, value);
  }

  void updateQuantity(int index, ProductModel? product, int value) {
    product!.quantity = value;
    products[index] = product;
  }

  void saveNewQuantity(ProductModel product, String field, int value) {
    firebaseService.updateProduct(product, field, value);
  }

  pickImage(BuildContext context) async {
    // ImagePicker picker = ImagePicker();
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nothing is selected'),
          ),
        );
      }
      if (image != null) {
        await imageService.uploadImage(image);
        var imageUrl = await imageService.getDownloadURL(image.name);
        newProduct.update('imageUrl', (_) => imageUrl,
            ifAbsent: () => imageUrl);
        print(newProduct['imageUrl']);
      }
    } catch (e) {
      print(e);
    }
  }
}
