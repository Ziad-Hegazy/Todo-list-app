import 'package:flutter/material.dart';

class AppColors{
  static Color white=Colors.white;
  static Color grey=Color.fromARGB(255,240,240,240);
  static Color black=Colors.black;
  static Color lightBlack=Colors.black54;
  
}

ColorScheme appScheme=ColorScheme(
  brightness: ColorScheme.light().brightness,
  surface: AppColors.white,
  onSurface: AppColors.black,
  primary: AppColors.black,
  onPrimary: AppColors.white,
  primaryFixed: AppColors.black,
  onPrimaryFixed: AppColors.white,
  error: ColorScheme.light().error,
  onError: ColorScheme.light().onError,
  primaryContainer: AppColors.black,
  onPrimaryContainer: AppColors.white,
  surfaceContainerHigh: AppColors.white,
  secondary: AppColors.black,
  onSecondary: AppColors.white,
  secondaryFixed: AppColors.black,
  onSecondaryFixed: AppColors.white,
  secondaryContainer: AppColors.black,
  onSecondaryContainer: AppColors.white,
);