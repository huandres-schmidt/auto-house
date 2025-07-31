import 'package:flutter/material.dart';

import '../../../core/constants/font_contants.dart';

class ManutencaoBuscar extends StatelessWidget {
  const ManutencaoBuscar({super.key, required this.onChanged});

  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 16.0,
        right: 16.0,
        bottom: 5.0,
      ),
      child: SizedBox(
        height: 45,
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Pesquisar Manutenção',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: FontConstants.inter,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
