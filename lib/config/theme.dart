import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      useMaterial3: false,
      fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
    );
  }
}