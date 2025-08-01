import 'package:flutter/material.dart';

import '../../../core/constants/font_contants.dart';
import '../../../core/shared/app_system_info.dart';

class HomeVersao extends StatelessWidget {
  const HomeVersao({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Versão ${AppSystemInfo.appInfo!.appVersionInfo.appVersionName}",
        style: TextStyle(
          fontFamily: FontConstants.inter,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
