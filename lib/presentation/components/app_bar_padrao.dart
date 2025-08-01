import 'package:flutter/material.dart';

import '../../core/constants/assets_contants.dart';
import '../../core/constants/colors_contants.dart';

class AppBarPadrao extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPadrao({super.key, this.isButtonDelete, this.onPressed});

  final bool? isButtonDelete;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsConstants.whiteSolid,
      title: Image.asset(
        AssetsConstants.logoHorizontal,
        height: 50,
        color: ColorsConstants.intotheGreen,
      ),
      iconTheme: const IconThemeData(color: ColorsConstants.intotheGreen),
      centerTitle: true,
      actions: [
        Visibility(
          visible: isButtonDelete ?? false,
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.delete, color: Colors.red, size: 30.0),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
