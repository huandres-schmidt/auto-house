import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/components/app_bar_padrao.dart';
import 'package:pratica/presentation/historico/bloc/historico_bloc.dart';
import 'package:pratica/presentation/historico/widgets/historico_body.dart';

import '../../../core/constants/colors_contants.dart';

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
          if (state is HistoricoLoaded) {
            return HistoricoBody(veiculo: veiculo, state: state);
          }
          return const Center();
        },
      ),
    );
  }
}
