import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  // getData()async{
  //   var response = await crud.postRequest(AppLink.home, {});
  //   return response.fold((l) => l, (r) => r);
  // }
  searchDatat(String search)async{
    var response = await crud.postRequest(AppLink.search, {
      "search":search
    });
    return response.fold((l) => l, (r) => r);
  }
}