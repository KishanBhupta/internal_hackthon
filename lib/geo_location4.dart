import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class Geolocation extends StatefulWidget {
  const Geolocation({super.key});

  @override
  State<Geolocation> createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {
  MapController mapController =MapController();
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionStatus;
  LocationData?  _locationData;

  @override
  void initState() {
    // TODO: implement initState
    initLocation();
    super.initState();
  }

  initLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(_serviceEnabled){
        return;
      }
    }

    _permissionStatus = await location.hasPermission();
    if(_permissionStatus == PermissionStatus.denied){
      _permissionStatus = await location.requestPermission();
      if(_permissionStatus != PermissionStatus.granted){
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      log(_locationData.toString());
      mapController.move(LatLng(_locationData?.latitude ?? 0, _locationData?.longitude ?? 0), 16);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(initialZoom: 5),
          children: [
            // TileLayer(
            //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            // userAgentPackageName: 'com.example.app',
            // )
            Text("logntite" ),

          ],
        )
      ],),
    );
  }
}