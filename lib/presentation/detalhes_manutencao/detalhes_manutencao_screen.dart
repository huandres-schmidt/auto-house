import 'package:autohouse/data/models/manutencao_veiculo_model.dart';
import 'package:autohouse/presentation/detalhes_manutencao/bloc/detalhes_manutencao_bloc.dart';
import 'package:autohouse/presentation/detalhes_manutencao/widget/detalhes_manutencao_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalhesManutencaoScreen extends StatelessWidget {
  const DetalhesManutencaoScreen({
    super.key,
    required this.manutencao,
    required this.detalhesManutencaoBloc,
  });

  final ManutencaoVeiculoModel manutencao;
  final DetalhesManutencaoBloc detalhesManutencaoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:
          detalhesManutencaoBloc
            ..add(DetalhesManutencaoLoad(manutencao: manutencao)),
      child: const DetalhesManutencaoContent(),
    );
  }
}
