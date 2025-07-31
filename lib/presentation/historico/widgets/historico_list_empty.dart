import 'package:autohouse/data/models/veiculo_model.dart';
import 'package:autohouse/presentation/historico/bloc/historico_bloc.dart';
import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';
import '../../../injector.dart';
import 'historico_dados_veiculo.dart';

class HistoricoListEmpty extends StatelessWidget {
  const HistoricoListEmpty({super.key, required this.veiculo});

  final VeiculoModel veiculo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HistoricoDadosVeiculo(veiculo: veiculo),
          InkWell(
            onTap: () => _onPressed(context),
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
                      'Você ainda não tem manutenções cadastradas\n'
                      'Cadastre o sua primeira manutenção!\n'
                      'Clicando Aqui',
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

  void _onPressed(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.adicionarManutencao.route, arguments: veiculo)
        .then(
          (value) => getIt.get<HistoricoBloc>().add(HistoricoLoad(veiculo.id!)),
        );
  }
}
