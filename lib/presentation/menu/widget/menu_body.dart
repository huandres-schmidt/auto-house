import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';
import '../../home/home_screen.dart';
import '../../manutencao/manutencao_screen.dart';
import '../../veiculo/veiculo_screen.dart';
import '../bloc/menu_bloc.dart';
import '../menu_screen.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key, required this.index, required this.menuParams});

  final int index;
  final MenuParams menuParams;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(child: _widgetPages().elementAt(index)),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontFamily: FontConstants.inter,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: FontConstants.inter,
          ),
          showSelectedLabels: true,
          selectedItemColor: ColorsConstants.intotheGreen,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          elevation: 5.0,
          backgroundColor: ColorsConstants.whiteEdgar,
          items: items,
          currentIndex: index,
          onTap: (value) {
            context.read<MenuBloc>().add(MenuChangeScreen(value));
          },
        ),
      ),
    );
  }

  List<Widget> _widgetPages() {
    return [
      HomeScreen(homeBloc: menuParams.homeBloc),
      ManutencaoScreen(manutencaoBloc: menuParams.manutencaoBloc),
      VeiculoScreen(veiculoBloc: menuParams.veiculoBloc),
    ];
  }

  List<BottomNavigationBarItem> get items => [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 28.0),
      label: 'Home',
      activeIcon: Icon(
        Icons.home,
        color: ColorsConstants.intotheGreen,
        size: 28.0,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.car_repair_sharp, size: 28.0),
      label: 'Manutenções',
      activeIcon: Icon(
        Icons.car_repair_sharp,
        color: ColorsConstants.intotheGreen,
        size: 28.0,
      ),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.directions_car, size: 28.0),
      label: 'Veículos',
      activeIcon: Icon(
        Icons.directions_car,
        color: ColorsConstants.intotheGreen,
        size: 28.0,
      ),
    ),
  ];
}
