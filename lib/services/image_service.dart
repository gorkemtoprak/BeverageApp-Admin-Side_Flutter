import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as fb_storage;
import 'package:image_picker/image_picker.dart';

class ImageService {
  final fb_storage.FirebaseStorage storage =
      fb_storage.FirebaseStorage.instance;

  Future<void> uploadImage(XFile image) async {
    await storage.ref('product_images/${image.name}').putFile(File(image.path));
  }

  Future<String> getDownloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('product_images/$imageName').getDownloadURL();
    return downloadURL;
  }
}
