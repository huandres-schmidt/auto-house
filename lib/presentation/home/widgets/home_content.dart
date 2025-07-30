import 'package:autohouse/presentation/home/widgets/home_list_veiculo_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors_contants.dart';
import '../../components/app_bar_padrao.dart';
import '../bloc/home_bloc.dart';
import 'home_body.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: const AppBarPadrao(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: _listener,
        builder: (context, state) {
          if (state is HomeLoaded) {
            return HomeBody(state: state);
          }
          if (state is HomeVeiculoEmpty) {
            return HomeListVeiculoEmpty(nome: state.nome ?? '');
          }
          return const Center();
        },
      ),
    );
  }

  void _listener(BuildContext context, Object? state) {}
}
