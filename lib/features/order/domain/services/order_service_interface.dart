

import 'package:admin_app/features/order/domain/models/order_model.dart';

abstract class OrderServiceInterface {
  Future<List<OrderModel>?> getCurrentOrders();
}