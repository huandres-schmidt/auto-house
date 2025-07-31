import 'package:autohouse/data/models/manutencao_veiculo_model.dart';
import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';

class HistoricoManutencao extends StatelessWidget {
  const HistoricoManutencao({super.key, required this.manutencao});

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
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.detalhesManutencao.route,
              arguments: manutencao,
            );
          },
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
            '${manutencao?.manutecao?.data} -'
            ' R\$ ${manutencao?.manutecao?.valor?.toStringAsFixed(2)}',
            style: TextStyle(fontFamily: FontConstants.inter),
          ),
        ),
      ),
    );
  }
}
