import 'package:delivery_apps/view/screen/home.dart';
import 'package:delivery_apps/view/screen/orders/accepted_orders.dart';
import 'package:delivery_apps/view/screen/orders/pending_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImpl extends HomeScreenController {
  int currentPage = 0;

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  List<Widget> listpage = [
    const PendingOrder(),
    const AcceptedOrders(),
     const Home(),

   
  ];
  List titleIcon = ["Pending", "Accepted","Settings"];
  List<IconData> icons = [
    Icons.pending_actions,
    Icons.archive,
    Icons.settings
   
  ];
}
