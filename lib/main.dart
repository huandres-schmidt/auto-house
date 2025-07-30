import 'package:flutter/material.dart';

import 'app.dart';
import 'injector.dart';

void main() async {
  final Injector injector = await _initializeApp();
  runApp(AutoHouseApp(injector: injector));
}

Future<Injector> _initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Injector injector = await InjectorImpl.initializeDependencies();
  return injector;
}