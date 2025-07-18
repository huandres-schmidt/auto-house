import 'package:flutter/material.dart';
import 'package:pratica/app.dart';
import 'package:pratica/injector.dart';

void main() async {
  final Injector injector = await _initializeApp();
  runApp(AutoHouseApp(injector: injector));
}

Future<Injector> _initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Injector injector = await InjectorImpl.initializeDependencies();
  return injector;
}