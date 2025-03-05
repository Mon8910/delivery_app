import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;



Set<Polyline> polylineSet = {};
const String googleMapsApiKey = "AIzaSyAr4aSrpDcqPykxU3-Lm7d5yx-RJl1T8T4";

List<LatLng> polylineco = [];
PolylinePoints polylinePoints = PolylinePoints();
Future<void> getPolyLine(lat, long, destlat, destlong) async {
  var url = 'https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=$googleMapsApiKey';
  
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);

    if (responseBody['routes'].isNotEmpty) {
      var point = responseBody['routes'][0]['overview_polyline']['points'];
      List<PointLatLng> result = polylinePoints.decodePolyline(point);

      if (result.isNotEmpty) {
        polylineco.clear(); // تنظيف القائمة قبل الإضافة
        for (var pointLatLng in result) {
          polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
        }

        Polyline polyline = Polyline(
          polylineId: PolylineId("route"),
          color: Color(0xff3498db),
          width: 5,
          points: polylineco,
        );

        polylineSet.add(polyline);
      }
    } else {
      print("⚠️ No routes found!");
    }
  } else {
    print("❌ API Error: ${response.statusCode}");
    print("Response: ${response.body}");
  }
}



