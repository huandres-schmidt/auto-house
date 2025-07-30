import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/presentation/menu/widget/menu_content.dart';

import '../home/bloc/home_bloc.dart';
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

  MenuParams({required this.menuBloc, required this.homeBloc});

  @override
  String toString() {
    return 'MenuParams{'
        'menuBloc: $menuBloc, '
        'homeBloc: $homeBloc'
        '}';
  }
}
