import 'package:flutter/cupertino.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/adicionar_manutencao/widget/adicionar_manutencao_form.dart';

class AdicionarManutencaoBody extends StatelessWidget {
  const AdicionarManutencaoBody({super.key, required this.veiculoModel});

  final VeiculoModel veiculoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: AdicionarManutencaoForm(veiculo: veiculoModel),
    );
  }
}
