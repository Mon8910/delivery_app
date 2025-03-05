import 'package:delivery_apps/controller/orders/accepted_orders_controller.dart';
import 'package:delivery_apps/core/constant/app_color.dart';
import 'package:delivery_apps/core/constant/app_routes.dart';
import 'package:delivery_apps/data/model/orders_model.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class DoneOrder extends GetView<AcceptedOrdersController> {
  const DoneOrder({super.key, required this.ordersModel});
  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Orders Number:  ${ordersModel.ordersId}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            // Text(
            //     "Order Type:${controller.printOrdersType(ordersModel.ordersType.toString())}"),
            Text("Order Price:${ordersModel.ordersPrice}\$"),
            Text("Delivery Price :${ordersModel.ordersPricedelivery}\$"),
            Text(
                "Payment Method:  ${controller.printPaymentType(ordersModel.ordersPaymrntmethods.toString())}"),
            // Text(
            //     "Orders Status:  ${controller.printOrdersStatus(ordersModel.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                Text("Total Price:${ordersModel.ordersTotalPrice}\$"),
                Spacer(),
                if (ordersModel.ordersStatus == 3)
                  TextButton(
                      onPressed: () {
                        controller.doneData(ordersModel.ordersUserid, ordersModel.ordersId);
                      
                      },
                      child: const Text(
                        'Approve',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.secoundColor),
                      )),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.orderDetails,
                          arguments: {"orderdetails": ordersModel});
                    },
                    child: const Text(
                      'Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.secoundColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
