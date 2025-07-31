import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';
import '../../../data/models/manutencao_model.dart';

class HistoricoManutencao extends StatelessWidget {
  const HistoricoManutencao({super.key, required this.manutencao});

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
          leading: Image.asset(
            manutencao?.tipo?.asset ?? '',
            color: manutencao?.tipo?.color,
            height: 40,
            width: 40,
          ),
          title: Text(
            '${manutencao?.tipo?.tipo}',
            style: TextStyle(
              fontFamily: FontConstants.inter,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          subtitle: Text(
            '${manutencao?.data} - R\$ ${manutencao?.valor?.toStringAsFixed(2)}',
            style: TextStyle(fontFamily: FontConstants.inter),
          ),
        ),
      ),
    );
  }
}
