import 'dart:convert';
import 'dart:ffi';


class LocationModel {
  final String userId;
  final double? latitude;
  final double? longitude;
  final String centerPoint;

  LocationModel({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.centerPoint,
  });


  // To create the model from a JSON object
  factory LocationModel.fromMap(Map<String, dynamic> json) {
    return LocationModel(
      userId: json['userId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      centerPoint: json['centerPoint'],
    );
  }

  // To convert the model to a JSON object
  Map<String, dynamic> toJson() {
    return<String , dynamic>{
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
      'centerPoint': centerPoint,
    };
  }

}
