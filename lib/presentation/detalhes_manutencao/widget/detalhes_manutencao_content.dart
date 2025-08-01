import 'package:autohouse/presentation/detalhes_manutencao/bloc/detalhes_manutencao_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/assets_contants.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';
import '../../../data/models/manutencao_veiculo_model.dart';
import '../../components/app_bar_padrao.dart';
import '../../components/dialog/dialog.dart';
import '../../components/divider_custom.dart';
import '../../home/widgets/home_seus_veiculos.dart';
import 'detalhes_manutencao_list.dart';

class DetalhesManutencaoContent extends StatelessWidget {
  const DetalhesManutencaoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetalhesManutencaoBloc, DetalhesManutencaoState>(
      listener: _listener,
      builder: (context, state) {
        if (state is DetalhesManutencaoLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DetalhesManutencaoLoaded) {
          return Scaffold(
            backgroundColor: ColorsConstants.whiteSolid,
            appBar: AppBarPadrao(
              isButtonDelete: true,
              onPressed: () => _onPressed(context, state.manutencao!),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: HomeTitle(text: 'Detalhes da Manutenção'),
                  ),
                  DetalhesManutencaoList(
                    assets: state.manutencao?.veiculo?.marca?.asset ?? '',
                    title: "Modelo",
                    trailing: state.manutencao?.veiculo?.modelo ?? '',
                  ),
                  DetalhesManutencaoList(
                    assets: state.manutencao?.manutecao?.tipo?.asset,
                    title: "Tipo",
                    trailing: state.manutencao?.manutecao?.tipo?.tipo ?? '',
                  ),
                  DetalhesManutencaoList(
                    assets: AssetsConstants.iconPeca,
                    title: "Nome da Peça",
                    trailing: state.manutencao?.manutecao?.nomePeca ?? '',
                  ),
                  DetalhesManutencaoList(
                    assets: AssetsConstants.iconMarca,
                    title: "Marca",
                    trailing: state.manutencao?.manutecao?.marca ?? '',
                  ),
                  DetalhesManutencaoList(
                    assets: AssetsConstants.iconQuilometragem,
                    title: "Quilometragem",
                    trailing: state.manutencao?.manutecao?.quilometragem ?? '',
                  ),
                  DetalhesManutencaoList(
                    assets: AssetsConstants.iconAno,
                    title: "Data",
                    trailing: state.manutencao?.manutecao?.data ?? '',
                  ),
                  DetalhesManutencaoList(
                    iconData: Icons.attach_money,
                    title: "Valor R\$",
                    trailing:
                        state.manutencao?.manutecao?.valor?.toStringAsFixed(
                          2,
                        ) ??
                        '0.00',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          state.manutencao?.manutecao?.observacao ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontConstants.inter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const Center();
      },
    );
  }

  void _onPressed(BuildContext context, ManutencaoVeiculoModel manutencao) {
    DialogCustom.dialogConfirm(
      context,
      'Atenção!!',
      'Deseja realmente excluir essa manutenção?',
      () {
        context.read<DetalhesManutencaoBloc>().add(
          DetalhesManutencaoDelete(manutencao: manutencao.manutecao!),
        );
        Navigator.of(context).pop();
      },
    );
  }

  void _listener(BuildContext context, DetalhesManutencaoState state) {
    if (state is DetalhesManutencaoDeleted) {
      Navigator.of(context).pop();
    }
  }
}
