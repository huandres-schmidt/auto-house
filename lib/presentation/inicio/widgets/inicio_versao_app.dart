import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/shared/app_system_info.dart';

class InicioVersaoApp extends StatelessWidget {
  const InicioVersaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Center(
        child: Text(
          "Versão "
          "${AppSystemInfo.appInfo?.appVersionInfo.appVersionName} - "
          "${AppSystemInfo.appInfo?.appVersionInfo.appVersionCode}",
          style: const TextStyle(
            color: ColorsConstants.whiteEdgar,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
