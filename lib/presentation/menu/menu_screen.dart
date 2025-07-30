import 'package:autohouse/presentation/menu/widget/menu_content.dart';
import 'package:autohouse/presentation/veiculo/bloc/veiculo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/bloc/home_bloc.dart';
import '../manutencao/bloc/manutencao_bloc.dart';
import 'bloc/menu_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.menuParams});

  final MenuParams menuParams;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>.value(
      value: menuParams.menuBloc..add(const MenuLoad()),
      child: MenuContent(menuParams: menuParams),
    );
  }
}

final class MenuParams {
  final MenuBloc menuBloc;
  final HomeBloc homeBloc;
  final ManutencaoBloc manutencaoBloc;
  final VeiculoBloc veiculoBloc;

  MenuParams({
    required this.menuBloc,
    required this.homeBloc,
    required this.manutencaoBloc,
    required this.veiculoBloc,
  });

  @override
  String toString() {
    return 'MenuParams{'
        'menuBloc: $menuBloc, '
        'homeBloc: $homeBloc'
        'manutencaoBloc: $manutencaoBloc'
        'veiculoBloc: $veiculoBloc'
        '}';
  }
}
