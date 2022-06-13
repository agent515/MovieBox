import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        textTheme: _textTheme(true),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.yellow,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.yellow,
          onPrimary: AppColors.black,
          secondary: AppColors.orange,
          onSecondary: AppColors.black,
          error: AppColors.red,
          onError: AppColors.black,
          background: AppColors.black,
          onBackground: AppColors.white,
          surface: AppColors.eerieBlack,
          onSurface: AppColors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizes.size10),
            borderSide: BorderSide(
              color: AppColors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(sizes.size10),
            borderSide: BorderSide(
              color: AppColors.yellow,
            ),
          ),
          filled: true,
          fillColor: AppColors.eerieBlack,
          hintStyle: GoogleFonts.openSans(color: AppColors.grey, fontSize: 14),
          errorStyle: GoogleFonts.openSans(color: AppColors.red, fontSize: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.yellow),
            foregroundColor: MaterialStateProperty.all(AppColors.black),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.openSans(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

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
