import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';

import '../../../core/constants/colors_contants.dart';

class AdicionarVeiculoButton extends StatelessWidget {
  const AdicionarVeiculoButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdicionarVeiculoBloc, AdicionarVeiculoState>(
      builder: (context, state) {
        return ElevatedButton.icon(
          label: _onButtonLoading(state),
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsConstants.intotheGreen,
            textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }

  Widget _onButtonLoading(AdicionarVeiculoState state) {
    if (state is AdicionarVeiculoLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: ColorsConstants.whiteEdgar,
        ),
      );
    } else {
      return const Text(
        'Adicionar Veículo',
        style: TextStyle(color: Colors.white),
      );
    }
  }
}
