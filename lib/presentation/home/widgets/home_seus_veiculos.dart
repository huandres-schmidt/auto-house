import 'package:flutter/cupertino.dart';

import '../../../core/constants/colors_contants.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: ColorsConstants.intotheGreen,
      ),
    );
  }
}
