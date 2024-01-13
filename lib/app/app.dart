import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/app/core/utils/injection_container.dart';
import 'package:navigation/features/navigation/cubit/navigation_cubit.dart';
import 'package:navigation/features/navigation/presentation/navigation_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => getIt<NavigationCubit>(),
        child: const NavigationPage(),
      ),
    );
  }
}
