import 'package:autohouse/core/constants/assets_contants.dart';
import 'package:autohouse/core/constants/colors_contants.dart';
import 'package:autohouse/core/constants/font_contants.dart';
import 'package:autohouse/data/models/manutencao_veiculo_model.dart';
import 'package:autohouse/presentation/components/app_bar_padrao.dart';
import 'package:autohouse/presentation/components/divider_custom.dart';
import 'package:autohouse/presentation/detalhes_manutencao/widget/detalhes_manutencao_list.dart';
import 'package:autohouse/presentation/home/widgets/home_seus_veiculos.dart';
import 'package:flutter/material.dart';

class DetalhesManutencaoScreen extends StatelessWidget {
  const DetalhesManutencaoScreen({super.key, required this.manutencao});

  final ManutencaoVeiculoModel manutencao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: const AppBarPadrao(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Center(child: HomeTitle(text: 'Detalhes da Manutenção')),
          DetalhesManutencaoList(
            isSvg: true,
            assets: manutencao.veiculo?.marca?.asset ?? '',
            title: "Modelo",
            trailing: manutencao.veiculo?.modelo ?? '',
          ),
          DetalhesManutencaoList(
            assets: manutencao.manutecao?.tipo?.asset,
            title: "Tipo",
            trailing: manutencao.manutecao?.tipo?.tipo ?? '',
          ),
          DetalhesManutencaoList(
            assets: AssetsConstants.iconPeca,
            title: "Nome da Peça",
            trailing: manutencao.manutecao?.nomePeca ?? '',
          ),
          DetalhesManutencaoList(
            assets: AssetsConstants.iconMarca,
            title: "Marca",
            trailing: manutencao.manutecao?.marca ?? '',
          ),
          DetalhesManutencaoList(
            assets: AssetsConstants.iconQuilometragem,
            title: "Quilometragem",
            trailing: manutencao.manutecao?.quilometragem ?? '',
          ),
          DetalhesManutencaoList(
            assets: AssetsConstants.iconAno,
            title: "Data",
            trailing: manutencao.manutecao?.data ?? '',
          ),
          DetalhesManutencaoList(
            iconData: Icons.attach_money,
            title: "Valor R\$",
            trailing: manutencao.manutecao?.valor?.toStringAsFixed(2) ?? '0.00',
          ),
          const DividerCustom(),
          Column(
            children: [
              Text(
                'Observação',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: FontConstants.inter,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.intotheGreen,
                ),
              ),
              Text(
                manutencao.manutecao!.observacao!,
                style: TextStyle(fontSize: 16, fontFamily: FontConstants.inter),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
