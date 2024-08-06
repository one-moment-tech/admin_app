
import 'package:admin_app/features/order/domain/models/order_model.dart';
import 'package:admin_app/features/order/domain/models/running_order_model.dart';
import 'package:admin_app/features/order/domain/services/order_service_interface.dart';
import 'package:get/get.dart';


class OrderController extends GetxController implements GetxService {
  final OrderServiceInterface orderServiceInterface;
  OrderController({required this.orderServiceInterface});

  List<OrderModel>? _runningOrderList;
  List<OrderModel>? get runningOrderList => _runningOrderList;

  List<RunningOrderModel>? _runningOrders;
  List<RunningOrderModel>? get runningOrders => _runningOrders;

  Future<void> getCurrentOrders() async {
    List<OrderModel>? runningOrderList = await orderServiceInterface.getCurrentOrders();
    if(runningOrderList != null) {
      _runningOrderList = [];
      _runningOrders = [
        RunningOrderModel(status: 'pending', orderList: []),
        RunningOrderModel(status: 'confirmed', orderList: []),
        RunningOrderModel(status: 'processing', orderList: []),
        RunningOrderModel(status: 'ready_for_handover', orderList: []),
        RunningOrderModel(status: 'food_on_the_way', orderList: []),
      ];
      _runningOrderList!.addAll(runningOrderList);
    }
    update();
  }
}