import 'package:flutter/material.dart';
import 'package:navigation/app/app.dart';
import 'package:navigation/app/core/utils/injection_container.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
