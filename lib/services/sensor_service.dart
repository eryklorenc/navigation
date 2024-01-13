import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:sensors_plus/sensors_plus.dart';

@injectable
class SensorService {
  Stream<AccelerometerEvent> get accelerometerStream => accelerometerEventStream();
  Stream<GyroscopeEvent> get gyroscopeStream => gyroscopeEventStream();

  LatLng updateLocationWithAccelerometer(AccelerometerEvent event, LatLng currentLocation) {
    double delta = 0.0000000000001; 

    if (event.x.abs() > 1) {
      return LatLng(currentLocation.latitude, currentLocation.longitude + delta);
    } else if (event.y.abs() > 1) {
      return LatLng(currentLocation.latitude + delta, currentLocation.longitude);
    }
    return currentLocation;
  }

  double updateOrientationWithGyroscope(GyroscopeEvent event, double? currentHeading) {
    double sensitivity = 8.0; 
    if (event.z.abs() > sensitivity) {
      return (currentHeading ?? 0) + event.z;
    }
    return currentHeading ?? 0;
  }
  
}