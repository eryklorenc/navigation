part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    @Default('') String errorMessage,
    @Default(false) bool isLoading,
    LatLng? currentLocation,
    double? heading,
    required List<LatLng> routePoints,
    required List<Polyline> routePolyline,
  }) = _NavigationState;
}
