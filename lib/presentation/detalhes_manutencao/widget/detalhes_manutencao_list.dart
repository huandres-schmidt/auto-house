import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';

class DetalhesManutencaoList extends StatelessWidget {
  const DetalhesManutencaoList({
    super.key,
    this.iconData,
    this.assets,
    this.isSvg = false,
    required this.title,
    required this.trailing,
  });

  final IconData? iconData;
  final String? assets;
  final String title;
  final String trailing;
  final bool isSvg;

  Widget get leadingIcon {
    if (iconData != null) {
      return Icon(iconData, color: ColorsConstants.intotheGreen, size: 25);
    }

    return Image.asset(
      assets!,
      width: 25,
      height: 25,
      color: ColorsConstants.intotheGreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: FontConstants.inter,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(fontFamily: FontConstants.inter, fontSize: 15),
      ),
    );
  }
}
