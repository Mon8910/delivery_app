import 'package:delivery_apps/controller/home_screen_controller.dart';
import 'package:delivery_apps/view/widgets/home/custom_bottom_appbar_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImpl());

    return GetBuilder<HomeScreenControllerImpl>(
        builder: (controller) => Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppbarHomescreen(),
              body: controller.listpage.elementAt(controller.currentPage),
            ));
  }
}
