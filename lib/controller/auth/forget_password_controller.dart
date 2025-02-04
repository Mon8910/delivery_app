import 'package:delivery_apps/core/class/statusrequest.dart';
import 'package:delivery_apps/core/constant/app_routes.dart';
import 'package:delivery_apps/core/function/handling_data.dart';
import 'package:delivery_apps/data/datasource/forget_password.dart/check_email_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  goToverifty();
  checkEmail();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController email;
  late StatusRequest statusRequest;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  checkEmail() {}

  @override
  goToverifty() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await checkEmailData.postDtat(email.text);
      print('======================= $response');
      statusRequest = handlingData(response);
      if (response['status'] == 'success') {
        //data.addAll(response);
        Get.offNamed(AppRoutes.verifyCode, arguments: {'email': email.text});
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'email not valid ');

        statusRequest = StatusRequest.failure;
      }
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
