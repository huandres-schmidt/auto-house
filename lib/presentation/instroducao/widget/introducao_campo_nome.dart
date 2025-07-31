import 'package:autohouse/core/constants/colors_contants.dart';
import 'package:flutter/material.dart';

class IntroducaoCampoNome extends StatelessWidget {
  const IntroducaoCampoNome({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: TextFormField(
        controller: controller,
        validator: (value) => _onInicioValidarNome(value),
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: ColorsConstants.intotheGreen,
          fontSize: 16.0,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: ColorsConstants.intotheGreen,
            size: 24.0,
          ),
          hintText: 'Como deseja ser chamado?',
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
      ),
    );
  }

  String? _onInicioValidarNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    return null;
  }
}
