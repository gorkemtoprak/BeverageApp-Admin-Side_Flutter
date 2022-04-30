import 'package:e_commerce_admin_panel/models/order_model.dart';
import 'package:e_commerce_admin_panel/services/firebase_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final FirebaseService firebaseService = FirebaseService();

  var orders = <OrderModel>[].obs;
  var pendingOrders = <OrderModel>[].obs;

  @override
  void onInit() {
    orders.bindStream(firebaseService.getOrders());
    pendingOrders.bindStream(firebaseService.getPendingOrders());
    super.onInit();
  }

  void updateOrders(OrderModel orderModel, String field, bool value) {
    firebaseService.updateOrder(orderModel, field, value);
  }
}
