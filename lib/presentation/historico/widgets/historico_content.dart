import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../data/models/veiculo_model.dart';
import '../../components/app_bar_padrao.dart';
import '../bloc/historico_bloc.dart';
import 'historico_body.dart';
import 'historico_list_empty.dart';

class HistoricoContent extends StatelessWidget {
  const HistoricoContent({super.key, required this.veiculo});

  final VeiculoModel veiculo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: const AppBarPadrao(),
      body: BlocBuilder<HistoricoBloc, HistoricoState>(
        builder: (context, state) {
          if (state is HistoricoLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsConstants.intotheGreen,
              ),
            );
          }
          if (state is HistoricoLoaded) {
            return HistoricoBody(veiculo: veiculo, state: state);
          }
          if (state is HistoricoEmpty) {
            return HistoricoListEmpty(veiculo: veiculo);
          }
          return const Center();
        },
      ),
    );
  }
}
