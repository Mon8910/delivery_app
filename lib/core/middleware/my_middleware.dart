import 'package:delivery_apps/core/constant/app_routes.dart';
import 'package:delivery_apps/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleware extends GetMiddleware{
  @override
   int?get priority => 1;
   MyServices services =Get.find();
   @override
   RouteSettings? redirect(String? route) {
    if(services.sharedPreferences.getString('step')=="2"){
      return const RouteSettings(name: AppRoutes.home);

    }
    if(services.sharedPreferences.getString('step')=="1"){
      return const RouteSettings(name: AppRoutes.login);

    }
    
   }
}