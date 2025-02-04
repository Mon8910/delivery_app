

import 'package:delivery_apps/controller/orders/pending_orders_controller.dart';
import 'package:delivery_apps/core/class/handling_data_view.dart';
import 'package:delivery_apps/view/widgets/orders/pending_orders_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => PendingOrdersItems(
                      ordersModel: controller.data[index],
                    ),
                  ),
                )),
      ),
    );
  }
}
