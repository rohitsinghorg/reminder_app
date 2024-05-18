import 'package:flutter/material.dart';

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildDarkTheme();
const String fontFamily = "Poppins";

TextTheme _buildTextTheme(TextTheme base) => base.copyWith();

ThemeData _buildDarkTheme() {
  const primaryColor = Color(0xFF0175c2);
  const secondaryColor = Color(0xFF13B9FD);
  // ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  final colorScheme = const ColorScheme.dark()
      .copyWith(primary: primaryColor, secondary: secondaryColor);
  //   final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor).copyWith();
  // .copyWith(primary: primaryColor, secondary: secondaryColor);
  final base = ThemeData(
    // pageTransitionsTheme: const PageTransitionsTheme(builders: {
    //   TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
    // }),
    fontFamily: fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: secondaryColor,
    indicatorColor: Colors.white,
    // toggleableActiveColor: const Color(0xFF6997DF),
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    // backgroundColor: const Color(0xFF202124),
    // errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: secondaryColor,
      brightness: Brightness.dark,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}

ThemeData _buildLightTheme() {
  const primaryColor = Color(0xFF0175c2);
  const secondaryColor = Color(0xFF13B9FD);
  final colorScheme = const ColorScheme.light()
      .copyWith(primary: primaryColor, secondary: secondaryColor);
  final base = ThemeData(
    // pageTransitionsTheme: const PageTransitionsTheme(builders: {
    //   TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
    // }),
    fontFamily: fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    // toggleableActiveColor: const Color(0xFF1E88E5),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // backgroundColor: Colors.white,
    // errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: colorScheme.copyWith(
      secondary: secondaryColor,
      brightness: Brightness.light,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}