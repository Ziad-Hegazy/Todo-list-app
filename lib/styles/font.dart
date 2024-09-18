import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppTextStyles {
  static TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 25,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 700)],
  );

  static TextStyle subTitle = TextStyle(
    color: AppColors.black,
    fontSize: 25,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 700)],
  );
  
  static TextStyle todo = TextStyle(
    color: AppColors.black,
    fontSize: 22,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 700)],
  );

  static const TextStyle task = TextStyle(
    fontSize: 18,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 600)],
  );

  static const TextStyle completedTask = TextStyle(
      fontSize: 18,
      fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 600)],
      decoration: TextDecoration.lineThrough,
      color: Colors.grey);

  static TextStyle counter = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 600)],
    fontSize: 16,
  );

  static const TextStyle sheetSubtitles = TextStyle(
    fontSize: 20,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 650)],
  );

  static const TextStyle sheetTasks = TextStyle(
    fontSize: 20,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 500)],
  );

  static TextStyle buttonText = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 650)],
    fontSize: 30,
  );
  static TextStyle FieldText = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 400)],
    fontSize: 18,
    color: appScheme.onSurface,
  );

}
