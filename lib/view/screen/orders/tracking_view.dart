import 'package:delivery_apps/controller/orders/order_details_controller.dart';
import 'package:delivery_apps/controller/orders/tracking_order_controller.dart';
import 'package:delivery_apps/core/class/handling_data_view.dart';
import 'package:delivery_apps/core/function/get_dircetional..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingView extends StatelessWidget {
  const TrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingOrderController()); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking '),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: GetBuilder<TrackingOrderController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                
                  Expanded(
                    child: Container(
                      
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        polylines: polylineSet,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.gmc=controllerMap;
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
