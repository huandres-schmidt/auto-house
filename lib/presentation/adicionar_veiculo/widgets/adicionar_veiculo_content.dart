import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';

import '../../../core/constants/assets_contants.dart';
import '../../../core/constants/colors_contants.dart';
import 'adicionar_veiculo_body.dart';

class AdicionarVeiculoContent extends StatelessWidget {
  const AdicionarVeiculoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: AppBar(
        backgroundColor: ColorsConstants.whiteSolid,
        centerTitle: true,
        title: Image.asset(
          AssetsConstants.logoHorizontal,
          height: 150,
          color: ColorsConstants.intotheGreen,
        ),
        iconTheme: const IconThemeData(color: ColorsConstants.intotheGreen),
      ),
      body: BlocConsumer<AdicionarVeiculoBloc, AdicionarVeiculoState>(
        listener: _listener,
        builder: (context, state) {
          return const AdicionarVeiculoBody();
        },
      ),
    );
  }

  void _listener(BuildContext context, AdicionarVeiculoState state) {
    if (state is AdicionarVeiculoSuccess) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.check_circle,
              color: ColorsConstants.intotheGreen,
              size: 60,
            ),
            title: const Text('Veículo Adicionado'),
            backgroundColor: ColorsConstants.whiteSolid,
            content: const Text('O veículo foi adicionado com sucesso!'),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsConstants.intotheGreen,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
    if (state is AdicionarVeiculoFail) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 60,
            ),
            title: const Text('Erro ao Adicionar Veículo'),
            backgroundColor: ColorsConstants.whiteSolid,
            content: Text(state.message),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
