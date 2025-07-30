import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors_contants.dart';
import '../bloc/adicionar_manutencao_bloc.dart';

class AdicionarManutencaoButton extends StatelessWidget {
  const AdicionarManutencaoButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdicionarManutencaoBloc, AdicionarManutencaoState>(
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

  Widget _onButtonLoading(AdicionarManutencaoState state) {
    if (state is AdicionarManutencaoLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: ColorsConstants.whiteEdgar,
        ),
      );
    } else {
      return const Text(
        'Adicionar Manutenção',
        style: TextStyle(color: Colors.white),
      );
    }
  }
}
