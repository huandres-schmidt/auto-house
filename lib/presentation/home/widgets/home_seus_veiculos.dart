import 'package:autohouse/core/constants/font_contants.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/constants/colors_contants.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: ColorsConstants.intotheGreen,
        fontFamily: FontConstants.inter,
      ),
    );
  }
}
