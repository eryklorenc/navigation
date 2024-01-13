import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import '../../data/datasources/location_datasource.dart';

@injectable
class LocationRepository {
  final LocationDataSource _dataSource;

  LocationRepository(this._dataSource);

  Stream<LatLng> getCurrentLocationStream() async* {
    bool serviceEnabled = await _dataSource.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await _dataSource.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _dataSource.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    yield* _dataSource
        .getCurrentPositionStream()
        .map((position) => LatLng(position.latitude, position.longitude));
  }
}
