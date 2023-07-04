// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class ThemeController {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static ThemeController of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color? primaryColor;
  Color? buttonSplashColor;
  Color? secondaryColor;
  Color? tertiaryColor;
  Color? primaryBackground;
  Color? secondaryBackground;
  Color? primaryText;
  Color? secondaryText;
  Color? alternate;
  Color? splashBackgroundColor;
  Image? logo;
  Image? splashImage;


  TextStyle get title1 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  TextStyle get title2 => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  TextStyle get title3 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  TextStyle get subtitle1 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  TextStyle get subtitle2 => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  TextStyle get bodyText1 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  TextStyle get bodyText2 => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
}

class LightModeTheme extends ThemeController {

  Color? primaryColor = const Color(0xFFFFBC00);
  Color? buttonSplashColor = Colors.orangeAccent;
  Color? secondaryColor = const Color(0xFFB2A7A7);
  Color? tertiaryColor = const Color(0xFF2F3743);
  Color? primaryBackground = const Color(0xFFFFFFFF);
  Color? secondaryBackground = const Color(0xFFF1F4F8);
  Color? primaryText = const Color(0xFF232121);
  Color? secondaryText = const Color(0xFF57636C);
  Color? alternate = const Color(0xfff6f6f6);
  Color? splashBackgroundColor = const Color(0xff001d2d);
  Image? logo = Image.asset('assets/images/logo.png');
  Image? splashImage = Image.asset('assets/images/splash.png');
}

class DarkModeTheme extends ThemeController {

  Color? primaryColor = const Color(0xFF3891D2);
  Color? buttonSplashColor = Colors.orange;
  Color? secondaryColor = const Color(0xFFF2EDED);
  Color? tertiaryColor = const Color(0xFFF2EDED);
  Color? alternate = const Color(0xFF454E57);
  Color? primaryBackground = const Color(0xFF2F3743);
  Color? secondaryBackground = const Color(0xFF1D2429);
  Color? primaryText = const Color(0xFFDBDBDB);
  Color? secondaryText = const Color(0xFF95A1AC);
  Color? splashBackgroundColor = const Color(0xff001d2d);
  Image? logo = Image.asset('assets/images/logo.png');
  Image? splashImage = Image.asset('assets/images/splash.png');
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
        fontFamily!,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        height: lineHeight,
      )
          : copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: lineHeight,
      );
}
