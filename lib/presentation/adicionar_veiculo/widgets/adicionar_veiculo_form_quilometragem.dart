import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pratica/core/constants/assets_contants.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_text.dart';


class AdicionarVeiculoFormQuilometragem extends StatelessWidget {
  const AdicionarVeiculoFormQuilometragem({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AdicionarVeiculoText(
      keyboardType: TextInputType.number,
      inputFormatters: [MaskTextInputFormatter(mask: '###.###')],
      controller: controller,
      validator: (value) => _onAdicionarValidarQuilometragem(value),
      assetsConstants: AssetsConstants.iconMotor,
      hintText: "Quilometragem",
    );
  }

  String? _onAdicionarValidarQuilometragem(String? value) {
    if (value == null || value.isEmpty) {
      return 'Quilometragem é obrigatório';
    }
    return null;
  }
}
