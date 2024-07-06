  import 'package:calculator_app/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,

  colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      background: Colors.grey.shade100,
      primary: Colors.white,
      onPrimary: AppColors.secondaryLightColor,
      secondary: Colors.black45,
    onSecondary: Colors.deepOrange.shade600

      ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey,
      displayColor: Colors.black54,
    )
);
  ThemeData darkMode=ThemeData(
    brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.light,
        background: Colors.black26,
        primary: Colors.black,
        secondary: Colors.white70,
          onSecondary: Colors.deepOrange.shade600
      ),
      textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.grey.shade400,
    displayColor: Colors.white,
      )
  );