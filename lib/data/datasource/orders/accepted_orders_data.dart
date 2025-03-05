import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';

class AcceptedOrdersData {
  Crud crud;
  AcceptedOrdersData(this.crud);
  getData(int deliveryid) async {
    var response = await crud
        .postRequest(AppLink.acceptedOrders, {"id": deliveryid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  doneOrderData(int userid, int ordersid) async {
    var response = await crud.postRequest(AppLink.doneDelivery, {
      "id": userid.toString(),
      "ordersidd":ordersid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
