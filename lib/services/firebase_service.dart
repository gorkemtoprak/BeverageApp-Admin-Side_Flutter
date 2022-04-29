import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_panel/models/product_model.dart';

class FirebaseService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<ProductModel>> getProducts() {
    return firebaseFirestore.collection('products').snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map((doc) => ProductModel.fromSnapshot(doc))
            .toList();
      },
    );
  }

  Future<void> addProduct(ProductModel product) {
    return firebaseFirestore.collection('products').add(product.toMap());
  }

  Future<void> updateProduct(
    ProductModel product,
    String field,
    dynamic newValue,
  ) {
    return firebaseFirestore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then(
          (querySnapshot) => {
            querySnapshot.docs.first.reference.update({field: newValue})
          },
        );
  }
}
