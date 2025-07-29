import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/historico/bloc/historico_bloc.dart';
import 'package:pratica/presentation/historico/widgets/historico_content.dart';

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
