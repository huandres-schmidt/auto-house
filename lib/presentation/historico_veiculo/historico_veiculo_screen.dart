import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratica/core/constants/colors_contants.dart';
import 'package:pratica/data/models/veiculo_model.dart';

class HistoricoVeiculoScreen extends StatelessWidget {
  const HistoricoVeiculoScreen({super.key, required this.veiculo});

  final VeiculoModel veiculo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstants.intotheGreen,
        toolbarHeight: 0.0,
      ),
      backgroundColor: ColorsConstants.whiteEdgar,
      body: Column(
        children: [
          SvgPicture.asset(veiculo.marca!.asset, width: 100, height: 100),
          Text(veiculo.toString()),
        ],
      ),
    );
  }
}
