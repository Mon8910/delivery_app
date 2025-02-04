
import 'package:delivery_apps/controller/home_screen_controller.dart';
import 'package:delivery_apps/view/widgets/home/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppbarHomescreen extends StatelessWidget {
  const CustomBottomAppbarHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listpage.length , (index) {
                   
                   return
                        
                         Expanded(
                           child: CustomBottomAppbar(
                              onPressed: () {
                                controller.changePage(index);
                              },
                              title: controller.titleIcon[index],
                              iconData: controller.icons[index],
                              isActive:
                                  controller.currentPage == index ? true : false,
                            ),
                         );
                  })
                ],
              ),
            ));
  }
}
