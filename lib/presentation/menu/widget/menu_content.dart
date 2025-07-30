import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/menu_bloc.dart';
import '../menu_screen.dart';
import 'menu_body.dart';

class MenuContent extends StatelessWidget {
  const MenuContent({super.key, required this.menuParams});

  final MenuParams menuParams;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return MenuBody(index: state.index, menuParams: menuParams);
      },
    );
  }
}
