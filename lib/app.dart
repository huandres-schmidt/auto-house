import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/injector.dart';
import 'package:pratica/presentation/home/bloc/home_bloc.dart';

import 'config/routes.dart';

class AutoHouseApp extends StatelessWidget {
  const AutoHouseApp({super.key, required this.injector});

  final Injector injector;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return injector.getIt.get<HomeBloc>()
          ..add(const HomeLoad());
      },
      child: MaterialApp(
        title: 'AutoHouse',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => Routes.router(settings, injector),
        initialRoute: AppRoutes.root.route,
      ),
    );
  }
}