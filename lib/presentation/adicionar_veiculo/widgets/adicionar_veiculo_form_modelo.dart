import 'package:flutter/material.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_text.dart';

class AdicionarVeiculoFormModelo extends StatelessWidget {
  const AdicionarVeiculoFormModelo({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AdicionarVeiculoText(
      keyboardType: TextInputType.text,
      inputFormatters: const [],
      controller: controller,
      validator: (value) => _onAdicionarValidarModelo(value),
      prefixIcon: const Icon(Icons.directions_car_sharp),
      hintText: "Modelo",
    );
  }

  String? _onAdicionarValidarModelo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Modelo é obrigatório';
    }
    return null;
  }
}
