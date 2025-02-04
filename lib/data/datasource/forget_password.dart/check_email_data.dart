
import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postDtat(
    String email,
    
  ) async {
    var response = await crud.postRequest(AppLink.checkemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
