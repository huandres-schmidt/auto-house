import 'package:flutter/material.dart';
import 'package:pratica/core/constants/colors_contants.dart';

import '../../../core/constants/assets_contants.dart';

class InicioLogo extends StatelessWidget {
  const InicioLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Image.asset(
          AssetsConstants.logoHorizontal,
          color: ColorsConstants.whiteEdgar,
        ),
        const SizedBox(height: 13),
        const Center(
          child: Text(
            'BEM-VINDO',
            style: TextStyle(
              color: ColorsConstants.whiteEdgar,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
      ],
    );
  }
}
