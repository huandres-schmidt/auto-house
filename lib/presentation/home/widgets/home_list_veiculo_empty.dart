import 'package:autohouse/injector.dart';
import 'package:autohouse/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';
import 'home_seus_veiculos.dart';

class HomeListVeiculoEmpty extends StatelessWidget {
  const HomeListVeiculoEmpty({super.key, required this.nome});

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: HomeTitle(text: 'Bem-vindo $nome')),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.adicionarVeiculo.route,
              ).then((value) => getIt.get<HomeBloc>().add(const HomeLoad()));
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: ColorsConstants.whiteEdgar,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: ColorsConstants.intotheGreen,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    size: 50,
                    color: ColorsConstants.intotheGreen,
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Você ainda não tem veículos cadastrados\nCadastre o seu primeiro veículo!\nClicando Aqui',
                      style: TextStyle(
                        fontFamily: FontConstants.inter,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
