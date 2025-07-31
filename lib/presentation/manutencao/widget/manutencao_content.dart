import 'package:autohouse/presentation/manutencao/widget/manutencao_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 16.0,
              right: 16.0,
              bottom: 5.0,
            ),
            child: TextFormField(
              onChanged: (value) {
                context.read<ManutencaoBloc>().add(
                  ManutencaoSearch(search: value),
                );
              },
              decoration: InputDecoration(
                hintText: 'Pesquisar Manutenção',
                hintStyle: TextStyle(
                  color: ColorsConstants.intotheGreen,
                  fontFamily: FontConstants.inter,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorsConstants.intotheGreen,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: ColorsConstants.intotheGreen,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: ColorsConstants.intotheGreen,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: ColorsConstants.intotheGreen,
                    width: 2.0,
                  ),
                ),
              ),
            ),
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
    );
  }
}
