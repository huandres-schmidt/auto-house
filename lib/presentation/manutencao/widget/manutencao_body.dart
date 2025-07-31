import 'package:autohouse/presentation/manutencao/bloc/manutencao_bloc.dart';
import 'package:flutter/material.dart';

import '../../components/divider_custom.dart';
import 'manutencao_card.dart';

class ManutencaoBody extends StatelessWidget {
  const ManutencaoBody({super.key, required this.state});

  final ManutencaoState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 230,
      child: ListView.separated(
        itemCount: state.manutencoes.length,
        separatorBuilder: (context, index) => const DividerCustom(),
        itemBuilder: (context, index) {
          final manutencao = state.manutencoes[index];
          return ManutencaoCard(manutencao: manutencao);
        },
      ),
    );
  }
}
