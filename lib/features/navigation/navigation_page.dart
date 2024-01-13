import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:navigation/data/datasources/location_datasource.dart';
import 'package:navigation/domain/repositories/location_repository.dart';
import 'package:navigation/services/sensor_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key, required this.title});

  final String title;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  LatLng currentLocation = const LatLng(52.2319581, 21.0067249);
  double? heading;
  double pi = 3.1415926535897932;
  final LocationRepository _locationRepository =
      LocationRepository(LocationDataSource());
  final SensorService _sensorService = SensorService();

  @override
  void initState() {
    super.initState();
    _listenToSensors();
    _listenToLocationUpdates();
    FlutterCompass.events!.listen((compassEvent) {
      setState(() {
        heading = compassEvent.heading;
      });
    });
  }

  List<Polyline> _createPolyline() {
    if (routePoints.isEmpty) {
      return [];
    }

    return [
      Polyline(
        points: [currentLocation, routePoints.last],
        strokeWidth: 4.0,
        color: Colors.red,
      ),
    ];
  }

  List<LatLng> routePoints = [];

  void _addPointToRoute(TapPosition position, LatLng latlng) {
    setState(() {
      if (routePoints.isEmpty) {
        
        routePoints.add(currentLocation);
      } else {
        
        routePoints.clear();
       
        routePoints.add(currentLocation);
      }
      
      routePoints.add(latlng);
    });
  }

  void _listenToSensors() {
    _sensorService.accelerometerStream.listen((event) {
      setState(() {
        currentLocation = _sensorService.updateLocationWithAccelerometer(
            event, currentLocation);
      });
    });

    _sensorService.gyroscopeStream.listen((event) {
      setState(() {
        heading = _sensorService.updateOrientationWithGyroscope(event, heading);
      });
    });
  }

  void _listenToLocationUpdates() {
    _locationRepository.getCurrentLocationStream().listen((latLng) {
      setState(() {
        currentLocation = latLng;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        onTap: _addPointToRoute,
        initialZoom: 5,
        initialCenter: currentLocation,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: currentLocation,
              width: 80,
              height: 80,
              child: Transform.rotate(
                angle: (heading ?? 0) * (pi / 180),
                child: const Icon(
                  Icons.navigation,
                  size: 40.0,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        PolylineLayer(
          polylines: _createPolyline(),
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
    );
  }
}
