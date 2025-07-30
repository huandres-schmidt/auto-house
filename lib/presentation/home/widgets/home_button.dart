import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../injector.dart';
import '../bloc/home_bloc.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: const Text(
        'Adicionar Veículo',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.add, color: Colors.white),
      onPressed: () {
        Navigator
            .of(context)
            .pushNamed(AppRoutes.adicionarVeiculo.route)
            .then((_) => getIt<HomeBloc>().add(const HomeLoad()));
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstants.intotheGreen,
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
