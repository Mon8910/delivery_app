import 'package:delivery_apps/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase (columnar,coulmnen){
  MyServices myServices=Get.find();

  if(myServices.sharedPreferences.getString('lang')=='ar'){
    return columnar;
  }else{
    return coulmnen;
  }

}