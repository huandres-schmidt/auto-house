import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratica/core/constants/assets_contants.dart';

import '../bloc/home_bloc.dart';

class HomeCardVeiculo extends StatelessWidget {
  const HomeCardVeiculo({super.key, required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.veiculos.length,
      itemBuilder: (context, index) {
        final veiculo = state.veiculos[index];
        return state.veiculos.isEmpty
            ? const Center(child: Text('Nenhum veículo cadastrado'))
            : ListTile(
              leading: SvgPicture.asset(veiculo?.marca?.asset ?? ''),
              title: Text('${veiculo?.modelo}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              subtitle: Text('${veiculo?.placa} - ${veiculo?.ano}'),
            );
      },
    );
  }
}
