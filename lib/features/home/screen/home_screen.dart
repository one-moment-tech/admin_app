import 'dart:async';

import 'package:admin_app/features/order/controllers/order_controller.dart';
import 'package:admin_app/util/app_constants.dart';
import 'package:admin_app/util/dimensions.dart';
import 'package:admin_app/util/images.dart';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;

  Future<void> _loadData() async {
    await Get.find<OrderController>().getCurrentOrders();
  }

  void _startApiCall() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _loadData();
    });
  }

  @override
  void initState() {
    super.initState();
    // _loadData(); // todo: check if i need this? if the start api call doing the call immediately then there is no need for it
    // _startApiCall();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Image.asset(Images.logo, height: 30, width: 30),
        ),
        titleSpacing: 0,
        elevation: 0,
        title: Text(AppConstants.appName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: robotoMedium.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: Dimensions.fontSizeDefault,
            )),
      ),
      body: const SizedBox(),
      // body: RefreshIndicator(
      //   onRefresh: () async {
      //     await _loadData();
      //   },
      //   child: SingleChildScrollView(
      //     padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      //     physics: const AlwaysScrollableScrollPhysics(),
      //     child: Column(children: [
      //       GetBuilder<OrderController>(builder: (orderController) {
      //         List<OrderModel> orderList = [];
      //         if (orderController.runningOrders != null) {
      //           orderList = orderController
      //               .runningOrders![orderController.orderIndex].orderList;
      //         }
      //
      //         return Column(children: [
      //           orderController.runningOrders != null
      //               ? Container(
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     border: Border.all(
      //                         color: Theme.of(context).disabledColor, width: 1),
      //                     borderRadius:
      //                         BorderRadius.circular(Dimensions.radiusSmall),
      //                   ),
      //                   child: ListView.builder(
      //                     scrollDirection: Axis.horizontal,
      //                     itemCount: orderController.runningOrders!.length,
      //                     itemBuilder: (context, index) {
      //                       return OrderButtonWidget(
      //                         title: orderController
      //                             .runningOrders![index].status.tr,
      //                         index: index,
      //                         orderController: orderController,
      //                         fromHistory: false,
      //                       );
      //                     },
      //                   ),
      //                 )
      //               : const SizedBox(),
      //           orderController.runningOrders != null
      //               ? orderList.isNotEmpty
      //                   ? ListView.builder(
      //                       physics: const NeverScrollableScrollPhysics(),
      //                       shrinkWrap: true,
      //                       itemCount: orderList.length,
      //                       itemBuilder: (context, index) {
      //                         return OrderWidget(
      //                             orderModel: orderList[index],
      //                             hasDivider: index != orderList.length - 1,
      //                             isRunning: true);
      //                       },
      //                     )
      //                   : Padding(
      //                       padding: const EdgeInsets.only(top: 50),
      //                       child: Center(child: Text('no_order_found'.tr)),
      //                     )
      //               : ListView.builder(
      //                   physics: const NeverScrollableScrollPhysics(),
      //                   shrinkWrap: true,
      //                   itemCount: 10,
      //                   itemBuilder: (context, index) {
      //                     return OrderShimmerWidget(
      //                         isEnabled: orderController.runningOrders == null);
      //                   },
      //                 ),
      //         ]);
      //       }),
      //     ]),
      //   ),
      // ),
    );
  }
}
