import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../data/models/veiculo_model.dart';
import '../../../injector.dart';
import '../../components/divider_custom.dart';
import '../../components/elevated_button_icon.dart';
import '../bloc/historico_bloc.dart';
import 'historico_dados_veiculo.dart';
import 'historico_manutencao.dart';
import 'historico_text.dart';

class HistoricoBody extends StatelessWidget {
  const HistoricoBody({super.key, required this.veiculo, required this.state});

  final VeiculoModel veiculo;
  final HistoricoState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HistoricoDadosVeiculo(veiculo: veiculo),
        const HistoricoText(),
        const Divider(indent: 20.0, endIndent: 20.0),
        state.manutencoes.isEmpty
            ? const Center(
              child: Text(
                'Nenhuma manutenção registrada.',
                style: TextStyle(fontSize: 18),
              ),
            )
            : SizedBox(
              height: 500,
              child: ListView.separated(
                itemCount: state.manutencoes.length,
                separatorBuilder: (context, index) => const DividerCustom(),
                itemBuilder: (context, index) {
                  final manutencao = state.manutencoes[index];
                  return HistoricoManutencao(manutencao: manutencao);
                },
              ),
            ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 28.0),
          child: ElevatedButtonIcon(
            label: 'Adicionar Manutenção',
            onPressed: () => _onPressed(context),
          ),
        ),
      ],
    );
  }

  void _onPressed(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.adicionarManutencao.route, arguments: veiculo)
        .then((value) {
          getIt.get<HistoricoBloc>().add(HistoricoLoad(veiculo.id!));
        });
  }
}
