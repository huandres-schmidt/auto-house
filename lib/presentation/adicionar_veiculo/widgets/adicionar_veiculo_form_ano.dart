import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pratica/core/constants/assets_contants.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_text.dart';


class AdicionarVeiculoFormAno extends StatelessWidget {
  const AdicionarVeiculoFormAno({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AdicionarVeiculoText(
      keyboardType: TextInputType.number,
      inputFormatters: [MaskTextInputFormatter(mask: '####')],
      controller: controller,
      validator: (value) => _onAdicionarValidarAno(value),
      assetsConstants: AssetsConstants.iconAno,
      hintText: "Ano de Fabricação",
    );
  }

  String? _onAdicionarValidarAno(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ano é obrigatório';
    }
    return null;
  }
}
