import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/font_contants.dart';
import '../../../data/models/veiculo_model.dart';

class HistoricoDadosVeiculo extends StatelessWidget {
  const HistoricoDadosVeiculo({super.key, required this.veiculo});

  final VeiculoModel veiculo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        veiculo.modelo!,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: FontConstants.inter,
        ),
      ),
      subtitle: Text(
        'Placa: ${veiculo.placa}\n'
            'Ano: ${veiculo.ano}\n',
        style: TextStyle(fontSize: 16, fontFamily: FontConstants.inter),
      ),
      trailing: SvgPicture.asset(veiculo.marca!.asset, height: 80),
    );
  }
}
