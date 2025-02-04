import 'package:delivery_apps/core/class/statusrequest.dart';
import 'package:delivery_apps/core/constant/app_routes.dart';
import 'package:delivery_apps/core/function/handling_data.dart';
import 'package:delivery_apps/core/services/services.dart';
import 'package:delivery_apps/data/datasource/auth/login_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignup();
  goToForgetPassword();
 
  
}

class LoginControllerImpl extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  @override
  goToSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await loginData.postDtat(email.text, password.text);
      print('======================= $response');
      statusRequest = handlingData(response);
      if (response['status'] == 'success') {
        if(response['data']['delivery_approve']==1){
        myServices.sharedPreferences
            .setInt('id', response['data']['delivery_id']);
        myServices.sharedPreferences
            .setString('username', response['data']['delivery_name']);
        myServices.sharedPreferences
            .setString('email', response['data']['delivery_email']);
        myServices.sharedPreferences
            .setString('phone', response['data']['delivery_phone']);
            myServices.sharedPreferences
            .setString('step','2');
        
       
        //data.addAll(response);
        Get.offNamed(
          AppRoutes.home,
        );
        } else{
           Get.toNamed(AppRoutes.veriftyCodeSignUp,
            arguments: {'email': email.text});
        }
      } else {
        Get.defaultDialog(
            title: 'warning', middleText: 'email or password are incorrect ');
        statusRequest = StatusRequest.failure;
      }
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  
}
