import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_panel/models/order_model.dart';
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

  Stream<List<OrderModel>> getOrders() {
    return firebaseFirestore.collection('orders').snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map((doc) => OrderModel.fromSnapshot(doc))
            .toList();
      },
    );
  }

  Stream<List<OrderModel>> getPendingOrders() {
    return firebaseFirestore
        .collection('orders')
        .where('isDelivered', isEqualTo: false)
        .where('isCancelled', isEqualTo: false)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs
            .map((doc) => OrderModel.fromSnapshot(doc))
            .toList();
      },
    );
  }

  Future<void> addProduct(ProductModel product) {
    return firebaseFirestore.collection('products').add(product.toMap());
  }

  Future<void> updateProduct(
      ProductModel product, String title, dynamic value) {
    return firebaseFirestore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then(
          (querySnapshot) => {
            querySnapshot.docs.first.reference.update({title: value})
          },
        );
  }

  Future<void> updateOrder(OrderModel order, String title, dynamic value) {
    return firebaseFirestore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then(
          (querySnapshot) => {
            querySnapshot.docs.first.reference.update({title: value})
          },
        );
  }
}
