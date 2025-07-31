import 'package:flutter/cupertino.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/font_contants.dart';

class ManutencaoEmptyList extends StatelessWidget {
  const ManutencaoEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nenhuma manutenção encontrada.',
        style: TextStyle(
          color: ColorsConstants.intotheGreen,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: FontConstants.inter,
        ),
      ),
    );
  }
}
