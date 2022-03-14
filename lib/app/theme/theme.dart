import 'package:finder_app/app/theme/style/elevated_button_style.dart';
import 'package:finder_app/app/theme/style/input_decoration.dart';
import 'package:finder_app/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BaseTheme extends CoreTheme {
  @override
  ThemeData themeDataDesign() {
    return baseTheme.copyWith(
      textTheme: GoogleFonts.cairoTextTheme(),
      primaryColor: primaryColor,
      elevatedButtonTheme: AppElevatedButtonStyle(baseTheme: this).themeData(),
      inputDecorationTheme: AppInputDecoration(baseTheme: this).themeData(),
    );
  }
}