import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_apps/core/class/statusrequest.dart';
import 'package:delivery_apps/core/function/get_dircetional..dart';
import 'package:delivery_apps/core/services/services.dart';
import 'package:delivery_apps/data/model/orders_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrderController extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  CameraPosition? kGooglePlex;
  double? currentlang;
  double? currentlong;
  double? destlang;
  double? destlong;
  Timer? timer;
  List<Marker> markers = [];
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  getCurrentLocation() {
    kGooglePlex = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );
    markers.add(
      Marker(
        markerId: const MarkerId('dest'),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      ),
    );

    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print("============================location");
      print(position!.latitude);
      // refreshLocation();
      currentlang = position.latitude;
      currentlong = position.longitude;

      if (gmc != null) {
        gmc!.animateCamera(
          CameraUpdate.newLatLng(LatLng(currentlang!, currentlong!)),
        );
      }
      if (gmc != null) {
        gmc!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlang!, currentlong!)));
      }

      markers.removeWhere((e) => e.markerId.value == "current");

      markers.add(
        Marker(
          markerId: const MarkerId('current'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
      update();
    });
  }

  intialpoly() async {
    destlang = ordersModel.addressLat;
    destlong = ordersModel.addressLong;
    await Future.delayed(const Duration(seconds: 1));
    await getPolyLine(currentlang, currentlong, destlang, destlong);
  }

  refreshLocation() async{ 
    await Future.delayed(const Duration(seconds: 3));
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId.toString())
          .set({
        "deliveryid": myServices.sharedPreferences.getInt('id').toString(),
        "lat": currentlang.toString(),
        "long": currentlong.toString()
      });
    });
  }

  @override
  void onClose() {
    gmc!.dispose();
    positionStream!.cancel();
    timer!.cancel();

    super.onClose();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['orderdetails'];
    getCurrentLocation();
    refreshLocation();
    intialpoly();
    super.onInit();
  }
}
