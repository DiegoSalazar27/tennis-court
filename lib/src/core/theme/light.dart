import 'package:flutter/material.dart';

// const primaryColor = Color(0xffAAF724);
const primaryColor = Color(0xff82BC00);
const onPrimaryColor = Color(0xffFCFCFC);
const secondaryColor = Color(0xff346BC3);
const bg = Color(0xffFBFBFB);
const onBg = Color(0xffF4F7FC);
const borderBg = Color(0xff9B9C9D);
const appBarLinearGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xff052147), Color(0xff82BC00)],
);
const textColor = Color(0xff3D3D3D);
const kPagePadding = EdgeInsets.symmetric(horizontal: 30);

final light = ThemeData(
  // useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light().copyWith(
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    surface: bg,
    onSurface: textColor,
    surfaceContainerLowest: onBg,
    outline: borderBg,
    // outline: const Color(0xFFD0D5DD),
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      color: textColor,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: textColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
        color: textColor, fontSize: 14, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(
        color: textColor, fontSize: 12, fontWeight: FontWeight.normal),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 20),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      shape: WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll<Color?>(primaryColor),
      foregroundColor: WidgetStatePropertyAll<Color?>(onPrimaryColor),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    alignLabelWithHint: false,
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderBg,
        style: BorderStyle.solid,
        width: 1,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderBg,
        style: BorderStyle.solid,
        width: 1,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderBg,
        style: BorderStyle.solid,
        width: 1,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        style: BorderStyle.solid,
        width: 1,
      ),
    ),
    prefixIconColor: borderBg,
    suffixIconColor: borderBg,
    iconColor: borderBg,
  ),
  // listTileTheme: const ListTileThemeData(
  //   tileColor: lightOnBg,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(12),
  //     ),
  //   ),
  // ),
  // cardTheme: const CardTheme(
  //   color: lightOnBg,
  // ),
  // cardColor: lightOnBg,
);
