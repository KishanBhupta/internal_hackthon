import 'dart:math';

class Haversine {
  final int earthRadiusKm = 6371; // Approx Earth radius in KM

  // Method to check if the distance between two points is within 200 meters (0.2 km)
  bool isWithinRadius(double startLat, double startLong, double endLat, double endLong) {
    // Convert latitude and longitude from degrees to radians
    double startLatRad = _toRadians(startLat);
    double startLongRad = _toRadians(startLong);
    double endLatRad = _toRadians(endLat);
    double endLongRad = _toRadians(endLong);

    // Haversine formula
    double deltaLat = endLatRad - startLatRad;
    double deltaLong = endLongRad - startLongRad;

    double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(startLatRad) * cos(endLatRad) *
            sin(deltaLong / 2) * sin(deltaLong / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Distance in kilometers
    double distanceInKm = earthRadiusKm * c;

    // Return true if the distance is within 200 meters (0.2 kilometers)
    return distanceInKm <= 0.2;
  }

  // Helper function to convert degrees to radians
  double _toRadians(double degree) {
    return degree * pi / 180;
  }
}
