import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';

class InicioButton extends StatelessWidget {
  const InicioButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 0.065,
          ),
        ),
        child: const Text(
          'ENTRAR',
          style: TextStyle(fontSize: 16.0, color: ColorsConstants.intotheGreen),
        ),
      ),
    );
  }
}
