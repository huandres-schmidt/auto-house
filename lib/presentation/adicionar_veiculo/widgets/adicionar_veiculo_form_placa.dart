import 'package:flutter/material.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_text.dart';

import '../../../core/utils/upper_case_text_formatter.dart';
import '../../../core/utils/validar_placa.dart';

class AdicionarVeiculoFormPlaca extends StatelessWidget {
  const AdicionarVeiculoFormPlaca({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AdicionarVeiculoText(
      keyboardType: TextInputType.text,
      inputFormatters: [UpperCaseTextFormatter()],
      controller: controller,
      validator: (value) => _onAdicionarValidarPlaca(value),
      prefixIcon: const Icon(Icons.numbers),
      hintText: "Placa",
    );
  }

  String? _onAdicionarValidarPlaca(String? value) {
    if (value == null || value.isEmpty) {
      return 'Placa é obrigatório';
    }
    if (!ValidarPlaca.validarPlaca(value)) {
      return 'Placa inválida';
    }
    return null;
  }
}
