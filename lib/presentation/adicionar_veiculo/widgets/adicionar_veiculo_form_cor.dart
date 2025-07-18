import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';

class AdicionarVeiculoFormCor extends StatelessWidget {
  const AdicionarVeiculoFormCor({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => _onAdicionarValidarCor(value),
      style: const TextStyle(color: ColorsConstants.intotheGreen),
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.color_lens,
          color: ColorsConstants.intotheGreen,
          size: 35,
        ),
        hintText: 'Cor',
        hintStyle: TextStyle(color: ColorsConstants.intotheGreen),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsConstants.intotheGreen,
            width: 1.5,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsConstants.intotheGreen,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  String? _onAdicionarValidarCor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Cor é obrigatório';
    }
    return null;
  }
}
