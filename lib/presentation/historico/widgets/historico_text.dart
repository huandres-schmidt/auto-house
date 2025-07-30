import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors_contants.dart';

class HistoricoText extends StatelessWidget {
  const HistoricoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Histórico de Manutenções',
      style: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsConstants.intotheGreen,
      ),
    );
  }
}
