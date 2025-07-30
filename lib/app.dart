import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/injector.dart';
import 'package:pratica/presentation/auth/auth_screen.dart';
import 'package:pratica/presentation/auth/bloc/auth_bloc.dart';
import 'package:pratica/presentation/auth/bloc/auth_event.dart';
import 'package:pratica/presentation/home/bloc/home_bloc.dart';
import 'package:pratica/presentation/menu/bloc/menu_bloc.dart';

import 'config/routes.dart';

class AutoHouseApp extends StatelessWidget {
  const AutoHouseApp({super.key, required this.injector});

  final Injector injector;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return injector.getIt.get<AuthBloc>()..add(AuthCheckRequested());
      },
      child: MaterialApp(
        title: 'AutoHouse',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: (settings) => Routes.router(settings, injector),
        home: AuthScreen(
          homeBloc: injector.getIt.get<HomeBloc>(),
          menuBloc: injector.getIt.get<MenuBloc>(),
        ),
      ),
    );
  }
}
