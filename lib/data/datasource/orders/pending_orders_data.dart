
import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);
  getData() async {
    var response = await crud
        .postRequest(AppLink.pendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
  
  approveOrders(int deliveryid,int userid,int ordersid) async {
    var response = await crud
        .postRequest(AppLink.approveOrders, {
          "deliveryid":deliveryid.toString(),
          "userid":userid.toString(),
          "ordersidd":ordersid.toString()

       });
    return response.fold((l) => l, (r) => r);
  }

   
}
