import 'package:autohouse/presentation/components/divider_custom.dart';
import 'package:autohouse/presentation/veiculo/bloc/veiculo_bloc.dart';
import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../core/constants/colors_contants.dart';

class VeiculoBody extends StatelessWidget {
  const VeiculoBody({super.key, required this.state});

  final VeiculoState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
        left: 16.0,
        right: 16.0,
        bottom: 5.0,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: state.veiculos.length,
        separatorBuilder: (context, index) => const DividerCustom(),
        itemBuilder: (context, index) {
          final veiculo = state.veiculos[index];
          return Card(
            color: ColorsConstants.whiteSolid,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.historicoVeiculo.route,
                  arguments: veiculo,
                );
              },
              leading: Image.asset(
                veiculo?.marca?.asset ?? '',
                height: 40,
                width: 40,
              ),
              title: Text('${veiculo?.modelo}'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              subtitle: Text('${veiculo?.placa} - ${veiculo?.ano}'),
            ),
          );
        },
      ),
    );
  }
}
