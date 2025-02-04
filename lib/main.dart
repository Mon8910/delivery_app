import 'package:delivery_apps/bindings/initial_binding.dart';
import 'package:delivery_apps/core/localization/local.dart';
import 'package:delivery_apps/core/localization/translation.dart';
import 'package:delivery_apps/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServiecs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalControl control = Get.put(LocalControl());
    return GetMaterialApp(
      locale: control.language,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      theme: control.appTheme,
      debugShowCheckedModeBanner: false,
      //home: const Language(),
      
      initialBinding: InitialBinding(),
    getPages: routes,
    );
  }
}


