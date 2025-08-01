import 'package:flutter/material.dart';

import '../../core/constants/colors_contants.dart';
import '../../core/constants/font_contants.dart';

class MessageFail extends StatelessWidget {
  const MessageFail({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(Icons.warning, color: Colors.grey, size: 50.0),
        ),
        const SizedBox(height: 15.0),
        Text(
          'Opss! Algo deu errado.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
            fontFamily: FontConstants.inter,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontFamily: FontConstants.inter,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Tentar novamente',
            style: TextStyle(
              color: ColorsConstants.intotheGreen,
              fontSize: 16.0,
              fontFamily: FontConstants.inter,
            ),
          ),
        ),
      ],
    );
  }
}
