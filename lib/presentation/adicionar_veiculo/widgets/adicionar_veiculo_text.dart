import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/colors_contants.dart';

class AdicionarVeiculoText extends StatelessWidget {
  const AdicionarVeiculoText({
    super.key,
    required this.inputFormatters,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    required this.prefixIcon,
    required this.hintText,
  });

  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String? value) validator;
  final Icon prefixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      validator: (value) => validator(value),
      style: const TextStyle(color: ColorsConstants.intotheGreen),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorsConstants.intotheGreen),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsConstants.intotheGreen,
            width: 1.5,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsConstants.intotheGreen,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
