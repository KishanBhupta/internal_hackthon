import 'dart:convert';
import 'dart:developer'; // For logging
import 'package:http/http.dart' as http;
import 'package:internal_hackthon/Model/location_model.dart';

import '../utils/constant.dart';

class LocationRepository {

  Future<void> addLocation({
    required LocationModel locationModel
  }) async {
    try {
      log(locationModel.userId.toString());
      log(locationModel.latitude.toString());
      log(locationModel.longitude.toString());
      log(locationModel.centerPoint.toString());

      final response = await http.post(
        Uri.parse('$apiUrl?userId=${locationModel.userId}&lat=${locationModel.latitude}&lng=${locationModel.longitude}&centerPointId=${locationModel.centerPoint}'),  // Replace $apiUrl with your actual API URL
      );

      // Check the response status code
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('Location data added successfully.');


      } else {
        throw Exception('Failed to add location: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding location: $e');
      throw Exception('Failed to add location: $e');
    }
  }
}
