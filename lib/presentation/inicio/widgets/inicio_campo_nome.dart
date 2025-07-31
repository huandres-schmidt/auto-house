import 'package:autohouse/core/constants/colors_contants.dart';
import 'package:flutter/material.dart';

class InicioCampoNome extends StatelessWidget {
  const InicioCampoNome({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => _onInicioValidarNome(value),
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
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
    );
  }

  String? _onInicioValidarNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    return null;
  }
}
