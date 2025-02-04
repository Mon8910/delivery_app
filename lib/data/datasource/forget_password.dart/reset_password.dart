

import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postDtat(
    String email,
    String password,
  ) async {
    var response = await crud.postRequest(AppLink.resestpassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
