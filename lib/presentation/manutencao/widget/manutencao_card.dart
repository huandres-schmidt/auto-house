import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';
import '../../../data/models/manutencao_model.dart';

class ManutencaoCard extends StatelessWidget {
  const ManutencaoCard({super.key, required this.manutencao});

  final ManutencaoModel? manutencao;

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
          title: Text(
            manutencao!.tipo!.tipo,
            style: TextStyle(
              fontSize: 18,
              fontFamily: FontConstants.inter,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Km: ${manutencao?.marca}\n'
            'Data: ${manutencao?.data}\n'
            'Valor: R\$ ${manutencao?.valor?.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontFamily: FontConstants.inter,
            ),
          ),
        ),
      ),
    );
  }
}
