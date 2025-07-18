import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/config/routes.dart';
import 'package:pratica/presentation/home/bloc/home_bloc.dart';

import '../../../core/constants/colors_contants.dart';

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
            .then((_) => context.read<HomeBloc>().add(const HomeLoad()));
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstants.intotheGreen,
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
