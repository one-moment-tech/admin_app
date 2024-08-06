import 'package:admin_app/api/api_client.dart';
import 'package:admin_app/features/order/domain/models/order_model.dart';
import 'package:admin_app/features/order/domain/repositories/order_repository_interface.dart';
import 'package:admin_app/util/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepository implements OrderRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrderRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future<List<OrderModel>?> getList() async {
    List<OrderModel>? runningOrderList;
    Response response = await apiClient.getData(AppConstants.currentOrdersUri);
    if (response.statusCode == 200) {
      runningOrderList = [];
      response.body.forEach((order) {
        OrderModel orderModel = OrderModel.fromJson(order);
        runningOrderList!.add(orderModel);
      });
    }
    return runningOrderList;
  }

  @override
  Future get(int? id) async {
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body) async {
    throw UnimplementedError();
  }

  @override
  Future add(value) {
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    throw UnimplementedError();
  }
}
