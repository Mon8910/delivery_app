import 'package:delivery_apps/app_link.dart';
import 'package:delivery_apps/core/class/crud.dart';


class LoginData {
  Crud crud;
  LoginData(this.crud);
  postDtat(
    String email,
    String password,
  ) async {
    var response = await crud.postRequest(AppLink.loginLink, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}