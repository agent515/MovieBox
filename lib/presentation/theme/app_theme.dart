import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      textTheme: _textTheme(true),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.red,
      ));

  static TextTheme _textTheme(bool isDark) {
    Color textColor = isDark ? AppColors.white : AppColors.black;
    return TextTheme(
      headline1: GoogleFonts.openSans(color: textColor, fontSize: 40),
      headline2: GoogleFonts.openSans(color: textColor, fontSize: 32),
      headline3: GoogleFonts.openSans(
          color: textColor, fontSize: 24, fontWeight: FontWeight.w600),
      headline4: GoogleFonts.openSans(
          color: textColor, fontSize: 20, fontWeight: FontWeight.w600),
      headline5: GoogleFonts.openSans(
          color: textColor, fontSize: 18, fontWeight: FontWeight.w600),
      headline6: GoogleFonts.openSans(
          color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
      bodyText1: GoogleFonts.openSans(color: textColor, fontSize: 16),
      bodyText2: GoogleFonts.openSans(color: textColor, fontSize: 14),
    );
  }
}
