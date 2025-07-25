import 'package:flutter/material.dart';

import '../../core/constants/colors_contants.dart';

class ElevatedButtonIcon extends StatelessWidget {
  const ElevatedButtonIcon({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(label, style: const TextStyle(color: Colors.white)),
      icon: const Icon(Icons.add, color: Colors.white),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstants.intotheGreen,
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
