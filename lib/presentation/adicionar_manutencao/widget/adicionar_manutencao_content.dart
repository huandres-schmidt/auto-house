import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../data/models/veiculo_model.dart';
import '../../components/app_bar_padrao.dart';
import '../../components/dialog/dialog.dart';
import '../bloc/adicionar_manutencao_bloc.dart';
import 'adicionar_manutencao_body.dart';

class AdicionarManutencaoContent extends StatelessWidget {
  const AdicionarManutencaoContent({super.key, required this.veiculo});

  final VeiculoModel veiculo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: const AppBarPadrao(),
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
        'Nova manutenção adicionada',
        'A manutenção foi adicionada com sucesso!',
      );
    }
    if (state is AdicionarManutencaoFail) {
      DialogCustom.dialogError(
        context,
        'Error ao adicionar manutenção',
        state.message,
      );
    }
  }
}
