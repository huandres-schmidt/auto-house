import 'package:flutter/material.dart';

import 'adicionar_veiculo_form.dart';

class AdicionarVeiculoBody extends StatelessWidget {
  const AdicionarVeiculoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(28.0),
      child: AdicionarVeiculoForm(),
    );
  }
}
