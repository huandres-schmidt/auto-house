import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/adicionar_manutencao/bloc/adicionar_manutencao_bloc.dart';

import '../../../core/constants/assets_contants.dart';
import '../../../core/constants/colors_contants.dart';
import '../../components/dialog/dialog.dart';
import 'adicionar_manutencao_body.dart';

class AdicionarManutencaoContent extends StatelessWidget {
  const AdicionarManutencaoContent({super.key, required this.veiculo});

  final VeiculoModel veiculo;

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
          return AdicionarManutencaoBody(veiculoModel: veiculo);
        },
      ),
    );
  }

  void _listener(BuildContext context, Object? state) {
    if (state is AdicionarManutencaoSuccess) {
      DialogCustom.dialogSucess(
        context,
        'Novo Veículo Adicionado',
        'O veículo foi adicionado com sucesso!',
      );
    }
    if (state is AdicionarManutencaoFail) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.cancel, color: Colors.red, size: 60),
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
