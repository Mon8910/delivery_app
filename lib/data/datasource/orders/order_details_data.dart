
import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);
  getData(int id) async {
    var response = await crud.postRequest(AppLink.orderDetails, {
      "id":id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
