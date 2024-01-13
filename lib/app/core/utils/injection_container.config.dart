// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:navigation/data/datasources/location_datasource.dart' as _i3;
import 'package:navigation/domain/repositories/location_repository.dart' as _i4;
import 'package:navigation/features/navigation/cubit/navigation_cubit.dart'
    as _i6;
import 'package:navigation/services/sensor_service.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocationDataSource>(() => _i3.LocationDataSource());
    gh.factory<_i4.LocationRepository>(
        () => _i4.LocationRepository(gh<_i3.LocationDataSource>()));
    gh.factory<_i5.SensorService>(() => _i5.SensorService());
    gh.factory<_i6.NavigationCubit>(() => _i6.NavigationCubit(
          gh<_i4.LocationRepository>(),
          gh<_i5.SensorService>(),
        ));
    return this;
  }
}
