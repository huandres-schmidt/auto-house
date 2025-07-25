import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/presentation/adicionar_manutencao/bloc/adicionar_manutencao_bloc.dart';

import '../../../core/constants/assets_contants.dart';
import '../../../core/constants/colors_contants.dart';
import 'adicionar_manutencao_body.dart';

class AdicionarManutencaoContent extends StatelessWidget {
  const AdicionarManutencaoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: AppBar(
        backgroundColor: ColorsConstants.whiteSolid,
        centerTitle: true,
        title: Image.asset(
          AssetsConstants.logoHorizontal,
          height: 50,
          color: ColorsConstants.intotheGreen,
        ),
        iconTheme: const IconThemeData(color: ColorsConstants.intotheGreen),
      ),
      body: BlocConsumer<AdicionarManutencaoBloc, AdicionarManutencaoState>(
        listener: _listener,
        builder: (context, state) {
          return const AdicionarManutencaoBody();
        },
      ),
    );
  }

  void _listener(BuildContext context, Object? state) {}
}
