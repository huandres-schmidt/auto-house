import 'package:autohouse/core/constants/font_contants.dart';
import 'package:autohouse/presentation/veiculo/widget/veiculo_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors_contants.dart';
import '../../components/app_bar_padrao.dart';
import '../bloc/veiculo_bloc.dart';

class VeiculoContent extends StatelessWidget {
  const VeiculoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: const AppBarPadrao(),
      body: BlocBuilder<VeiculoBloc, VeiculoState>(
        builder: (context, state) {
          if (state is VeiculoLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsConstants.intotheGreen,
              ),
            );
          }
          if (state is VeiculoLoaded) {
            return VeiculoBody(state: state);
          }
          if (state is VeiculoEmpty) {
            return Center(
              child: Text(
                'Nenhum veículo encontrada.',
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
