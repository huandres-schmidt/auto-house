import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/presentation/inicio/inicio_screen.dart';
import 'package:pratica/presentation/menu/bloc/menu_bloc.dart';
import 'package:pratica/presentation/menu/menu_screen.dart';

import '../home/bloc/home_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.homeBloc, required this.menuBloc});

  final HomeBloc homeBloc;
  final MenuBloc menuBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return const CircularProgressIndicator();
        } else if (state is Authenticated) {
          return MenuScreen(
            menuParams: MenuParams(menuBloc: menuBloc, homeBloc: homeBloc),
          );
        } else {
          return InicioScreen();
        }
      },
    );
  }
}
