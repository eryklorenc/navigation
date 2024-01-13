import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:navigation/domain/repositories/location_repository.dart';
import 'package:navigation/services/sensor_service.dart';

part 'navigation_state.dart';
part 'navigation_cubit.freezed.dart';

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  final LocationRepository _locationRepository;
  final SensorService _sensorService;

  NavigationCubit(
    this._locationRepository,
    this._sensorService,
  ) : super(const NavigationState(routePoints: [], routePolyline: [])) {
    _init();
  }

  void _init() {
    _listenToLocationUpdates();
    _listenToSensors();
  }

  void _listenToSensors() {
    _sensorService.accelerometerStream.listen((event) {
      if (state.currentLocation != null) {
        var updatedLocation = _sensorService.updateLocationWithAccelerometer(
            event, state.currentLocation!);
        emit(state.copyWith(currentLocation: updatedLocation));
      }
    });

    _sensorService.gyroscopeStream.listen((event) {
      var updatedHeading =
          _sensorService.updateOrientationWithGyroscope(event, state.heading);
      emit(state.copyWith(heading: updatedHeading));
    });
  }

  void _listenToLocationUpdates() {
    _locationRepository.getCurrentLocationStream().listen((latLng) {
      emit(state.copyWith(currentLocation: latLng, errorMessage: ''));
    }, onError: (error) {
      ('Error fetching location: $error');
    });
  }

  List<Polyline> createPolyline() {
    if (state.currentLocation == null || state.routePoints.isEmpty) {
      return [];
    }

    return [
      Polyline(
        points: [state.currentLocation!, state.routePoints.last],
        strokeWidth: 4.0,
        color: Colors.red,
      ),
    ];
  }

  void addPointToRoute(TapPosition position, LatLng latlng) {
    emit(state.copyWith(routePoints: [...state.routePoints, latlng]));
  }
}
