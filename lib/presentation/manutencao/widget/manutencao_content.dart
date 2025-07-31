import 'package:autohouse/core/constants/font_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors_contants.dart';
import '../../components/app_bar_padrao.dart';
import '../../components/divider_custom.dart';
import '../bloc/manutencao_bloc.dart';
import 'manutencao_card.dart';

class ManutencaoContent extends StatelessWidget {
  const ManutencaoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: const AppBarPadrao(),
      body: BlocBuilder<ManutencaoBloc, ManutencaoState>(
        builder: (context, state) {
          if (state is ManutencaoLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsConstants.intotheGreen,
              ),
            );
          }
          if (state is ManutencaoLoaded) {
            return Column(
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.separated(
                    itemCount: state.manutencoes.length,
                    separatorBuilder: (context, index) => const DividerCustom(),
                    itemBuilder: (context, index) {
                      final manutencao = state.manutencoes[index];
                      return ManutencaoCard(manutencao: manutencao);
                    },
                  ),
                ),
              ],
            );
          }
          if (state is ManutencaoEmpty) {
            return Center(
              child: Text(
                'Nenhuma manutenção encontrada.',
                style: TextStyle(
                  color: ColorsConstants.intotheGreen,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontConstants.inter,
                ),
              ),
            );
          }
          return const Center();
        },
      ),
    );
  }
}
