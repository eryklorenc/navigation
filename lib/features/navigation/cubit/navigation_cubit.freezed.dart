// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  double? get heading => throw _privateConstructorUsedError;
  List<LatLng> get routePoints => throw _privateConstructorUsedError;
  List<Polyline> get routePolyline => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res, NavigationState>;
  @useResult
  $Res call(
      {String errorMessage,
      bool isLoading,
      LatLng? currentLocation,
      double? heading,
      List<LatLng> routePoints,
      List<Polyline> routePolyline});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res, $Val extends NavigationState>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? isLoading = null,
    Object? currentLocation = freezed,
    Object? heading = freezed,
    Object? routePoints = null,
    Object? routePolyline = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      routePoints: null == routePoints
          ? _value.routePoints
          : routePoints // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      routePolyline: null == routePolyline
          ? _value.routePolyline
          : routePolyline // ignore: cast_nullable_to_non_nullable
              as List<Polyline>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationStateImplCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$NavigationStateImplCopyWith(_$NavigationStateImpl value,
          $Res Function(_$NavigationStateImpl) then) =
      __$$NavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String errorMessage,
      bool isLoading,
      LatLng? currentLocation,
      double? heading,
      List<LatLng> routePoints,
      List<Polyline> routePolyline});
}

/// @nodoc
class __$$NavigationStateImplCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res, _$NavigationStateImpl>
    implements _$$NavigationStateImplCopyWith<$Res> {
  __$$NavigationStateImplCopyWithImpl(
      _$NavigationStateImpl _value, $Res Function(_$NavigationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? isLoading = null,
    Object? currentLocation = freezed,
    Object? heading = freezed,
    Object? routePoints = null,
    Object? routePolyline = null,
  }) {
    return _then(_$NavigationStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      routePoints: null == routePoints
          ? _value._routePoints
          : routePoints // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      routePolyline: null == routePolyline
          ? _value._routePolyline
          : routePolyline // ignore: cast_nullable_to_non_nullable
              as List<Polyline>,
    ));
  }
}

/// @nodoc

class _$NavigationStateImpl implements _NavigationState {
  const _$NavigationStateImpl(
      {this.errorMessage = '',
      this.isLoading = false,
      this.currentLocation,
      this.heading,
      required final List<LatLng> routePoints,
      required final List<Polyline> routePolyline})
      : _routePoints = routePoints,
        _routePolyline = routePolyline;

  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final LatLng? currentLocation;
  @override
  final double? heading;
  final List<LatLng> _routePoints;
  @override
  List<LatLng> get routePoints {
    if (_routePoints is EqualUnmodifiableListView) return _routePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routePoints);
  }

  final List<Polyline> _routePolyline;
  @override
  List<Polyline> get routePolyline {
    if (_routePolyline is EqualUnmodifiableListView) return _routePolyline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routePolyline);
  }

  @override
  String toString() {
    return 'NavigationState(errorMessage: $errorMessage, isLoading: $isLoading, currentLocation: $currentLocation, heading: $heading, routePoints: $routePoints, routePolyline: $routePolyline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            const DeepCollectionEquality()
                .equals(other._routePoints, _routePoints) &&
            const DeepCollectionEquality()
                .equals(other._routePolyline, _routePolyline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      isLoading,
      currentLocation,
      heading,
      const DeepCollectionEquality().hash(_routePoints),
      const DeepCollectionEquality().hash(_routePolyline));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      __$$NavigationStateImplCopyWithImpl<_$NavigationStateImpl>(
          this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {final String errorMessage,
      final bool isLoading,
      final LatLng? currentLocation,
      final double? heading,
      required final List<LatLng> routePoints,
      required final List<Polyline> routePolyline}) = _$NavigationStateImpl;

  @override
  String get errorMessage;
  @override
  bool get isLoading;
  @override
  LatLng? get currentLocation;
  @override
  double? get heading;
  @override
  List<LatLng> get routePoints;
  @override
  List<Polyline> get routePolyline;
  @override
  @JsonKey(ignore: true)
  _$$NavigationStateImplCopyWith<_$NavigationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
