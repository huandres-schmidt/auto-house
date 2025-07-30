import 'package:autohouse/presentation/historico/widgets/historico_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/veiculo_model.dart';
import 'bloc/historico_bloc.dart';

class HistoricoScreen extends StatelessWidget {
  const HistoricoScreen({
    super.key,
    required this.veiculo,
    required this.historicoBloc,
  });

  final HistoricoBloc historicoBloc;
  final VeiculoModel veiculo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: historicoBloc..add(HistoricoLoad(veiculo.id!)),
      child: HistoricoContent(veiculo: veiculo),
    );
  }
}
