
import 'package:delivery_apps/core/constant/app_routes.dart';
import 'package:delivery_apps/core/middleware/my_middleware.dart';
import 'package:delivery_apps/view/screen/auth/forget%20password/forget_password.dart';
import 'package:delivery_apps/view/screen/auth/forget%20password/reset_password.dart';
import 'package:delivery_apps/view/screen/auth/forget%20password/verify_code.dart';
import 'package:delivery_apps/view/screen/auth/login.dart';
import 'package:delivery_apps/view/screen/home_screen.dart';
import 'package:delivery_apps/view/screen/orders/archive_order.dart';
import 'package:delivery_apps/view/screen/orders/order_details.dart';
import 'package:delivery_apps/view/screen/orders/pending_order.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [

  
   GetPage(
    name:'/',
    page: () => const Login(),
    middlewares: [MyMiddleware()]
  ),
  
 
 
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPassword(),
  ),

  
  
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
  ),
 
 
  

  
 
  GetPage(
    name: AppRoutes.pendingOrders,
    page: () => const PendingOrder(),
  ),
  GetPage(
    name: AppRoutes.archiveOrders,
    page: () => const ArchiveOrder(),
  ),
  GetPage(
    name: AppRoutes.orderDetails,
    page: () => const OrderDetails(),
  ),
];
