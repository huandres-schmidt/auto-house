import 'package:autohouse/config/routes.dart';
import 'package:autohouse/core/constants/font_contants.dart';
import 'package:autohouse/data/models/manutencao_veiculo_model.dart';
import 'package:autohouse/injector.dart';
import 'package:autohouse/presentation/manutencao/bloc/manutencao_bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';

class ManutencaoCard extends StatelessWidget {
  const ManutencaoCard({super.key, required this.manutencao});

  final ManutencaoVeiculoModel? manutencao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
        left: 16.0,
        right: 16.0,
        bottom: 5.0,
      ),
      child: Card(
        color: ColorsConstants.whiteSolid,
        child: ListTile(
          onTap: () => _onPressed(context),
          leading: Image.asset(
            manutencao?.manutecao?.tipo?.asset ?? '',
            color: manutencao?.manutecao?.tipo?.color,
            height: 40,
            width: 40,
          ),
          title: Text(
            '${manutencao?.manutecao?.tipo?.tipo}',
            style: TextStyle(
              fontFamily: FontConstants.inter,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          subtitle: Text(
            '${manutencao?.manutecao?.data} - ${manutencao?.veiculo?.modelo}',
            style: TextStyle(fontFamily: FontConstants.inter),
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.detalhesManutencao.route,
      arguments: manutencao,
    ).then((_) => {
      getIt.get<ManutencaoBloc>().add(const ManutencaoLoad())
    });
  }
}
