import 'package:autohouse/presentation/instroducao/introducao_screen.dart';
import 'package:autohouse/presentation/veiculo/bloc/veiculo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/bloc/home_bloc.dart';
import '../manutencao/bloc/manutencao_bloc.dart';
import '../menu/bloc/menu_bloc.dart';
import '../menu/menu_screen.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    super.key,
    required this.homeBloc,
    required this.menuBloc,
    required this.manutencaoBloc,
    required this.veiculoBloc,
  });

  final HomeBloc homeBloc;
  final MenuBloc menuBloc;
  final ManutencaoBloc manutencaoBloc;
  final VeiculoBloc veiculoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return const CircularProgressIndicator();
        }
        if (state is Authenticated) {
          return MenuScreen(
            menuParams: MenuParams(
              menuBloc: menuBloc,
              homeBloc: homeBloc,
              manutencaoBloc: manutencaoBloc,
              veiculoBloc: veiculoBloc,
            ),
          );
        } else {
          return IntroducaoScreen();
        }
      },
    );
  }
}
