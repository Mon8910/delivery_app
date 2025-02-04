import 'package:delivery_apps/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controllerImpl = Get.put(HomeControllerImpl());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          
        ],
      ),
    );
  }
} //SvgPicture.network( '${AppLink.catImage}/${controllerImpl.categories[index]['categories_image']},');

