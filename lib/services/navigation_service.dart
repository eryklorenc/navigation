import 'dart:async';
import 'package:latlong2/latlong.dart';
import 'package:navigation/app/core/utils/injection_container.dart';
import 'package:navigation/domain/repositories/location_repository.dart';
import 'package:navigation/services/sensor_service.dart';

class NavigationService {
  final LocationRepository _locationRepository = getIt<LocationRepository>();
  final SensorService _sensorService = getIt<SensorService>();

  StreamSubscription? _locationSubscription;
  StreamSubscription? _accelerometerSubscription;
  StreamSubscription? _gyroscopeSubscription;

  LatLng currentLocation = const LatLng(52.2319581, 21.0067249);
  double? heading;

  void init() {
    _listenToSensors();
    _listenToLocationUpdates();
  }

  void dispose() {
    _locationSubscription?.cancel();
    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
  }

  void _listenToSensors() {
    _accelerometerSubscription = _sensorService.accelerometerStream.listen((event) {
      currentLocation = _sensorService.updateLocationWithAccelerometer(
          event, currentLocation);
    });

    _gyroscopeSubscription = _sensorService.gyroscopeStream.listen((event) {
      heading = _sensorService.updateOrientationWithGyroscope(event, heading);
    });
  }

  void _listenToLocationUpdates() {
    _locationSubscription = _locationRepository.getCurrentLocationStream().listen((latLng) {
      currentLocation = latLng;
    });
  }
}