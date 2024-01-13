import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:navigation/app/core/utils/injection_container.dart';
import 'package:navigation/features/navigation/cubit/navigation_cubit.dart';
import 'package:navigation/services/navigation_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  double? heading;
  NavigationService navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    navigationService.init();
    FlutterCompass.events!.listen((compassEvent) {
      setState(() {
        heading = compassEvent.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NavigationCubit>(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.errorMessage.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${state.errorMessage}'),
                  ),
                );
              },
            );
            return Container();
          } else {
            return Scaffold(
              body: FlutterMap(
                options: MapOptions(
                  onTap: (TapPosition position, LatLng latlng) {
                    context
                        .read<NavigationCubit>()
                        .addPointToRoute(position, latlng);
                  },
                  initialZoom: 5,
                  initialCenter: state.currentLocation ??
                      const LatLng(52.2319581, 21.0067249),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: state.currentLocation ??
                            const LatLng(52.2319581, 21.0067249),
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
                    polylines:
                        context.watch<NavigationCubit>().createPolyline(),
                  ),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () => launchUrl(
                            Uri.parse('https://openstreetmap.org/copyright')),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
