import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuni_phone_app/constant/constant.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: tertiaryColor,
    textTheme:
        GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme).copyWith(
      headline1: const TextStyle(
          color: Color(0xFF000000),
           fontSize: 30, fontWeight: FontWeight.w700),
      subtitle1: const TextStyle(
        fontSize: 16,
        color: tertiaryColor,
      ),
      bodyText1: const TextStyle(
        fontSize: 14,
        color: secondaryColor,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: const TextStyle(
        fontSize: 14,
        color: Color(0xFF000000),
      ),
    ),
  );
}
