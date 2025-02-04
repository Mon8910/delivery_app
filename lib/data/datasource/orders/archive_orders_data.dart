
import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';

class ArchiveOrdersData {
  Crud crud;
  ArchiveOrdersData(this.crud);
  getData(int deliveryid) async {
    var response = await crud
        .postRequest(AppLink.archiveOrders, {"id": deliveryid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
