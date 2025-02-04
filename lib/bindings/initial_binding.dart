import 'package:delivery_apps/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(Crud());
  }
}