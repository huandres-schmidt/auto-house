import 'package:autohouse/presentation/manutencao/widget/manutencao_body.dart';
import 'package:autohouse/presentation/manutencao/widget/manutencao_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors_contants.dart';
import '../../components/app_bar_padrao.dart';
import '../bloc/manutencao_bloc.dart';
import 'manutencao_empty.dart';

class ManutencaoContent extends StatelessWidget {
  const ManutencaoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: const AppBarPadrao(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ManutencaoBuscar(
              onChanged: (value) {
                context.read<ManutencaoBloc>().add(
                  ManutencaoSearch(search: value),
                );
              },
            ),
            BlocBuilder<ManutencaoBloc, ManutencaoState>(
              builder: (context, state) {
                if (state is ManutencaoLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsConstants.intotheGreen,
                    ),
                  );
                }
                if (state is ManutencaoLoaded) {
                  return ManutencaoBody(state: state);
                }
                if (state is ManutencaoEmpty) {
                  return const ManutencaoEmptyList();
                }
                return const Center();
              },
            ),
          ],
        ),
      ),
    );
  }
}
