import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppTextStyles {
  static TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 25,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 700)],
  );
  static TextStyle mainText = TextStyle(
    color: AppColors.lightBlack,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle small = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 600)],
    fontSize: 16,
  );
  static TextStyle sheetTitle = TextStyle(
      color: AppColors.white,
      fontFamily: 'SegoeUI',
      fontVariations: [FontVariation('wght', 700)],
      fontSize: 30,);
  static TextStyle buttonText = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 650)],
    fontSize: 30,
  );
  static TextStyle sheetText = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 400)],
  );
  static TextStyle sheetTextButton = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 600)],
  );
  static TextStyle FieldText = TextStyle(
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 400)],
    fontSize: 18,
    color: appScheme.onSurface,
  );
  static const TextStyle todoTextStyle = TextStyle(
    fontSize: 22,
    fontFamily: 'SegoeUI',
    fontVariations: [FontVariation('wght', 700)],
  );

  static const TextStyle completedTodoTextStyle = TextStyle(
      fontSize: 22,
      fontFamily: 'SegoeUI',
      fontVariations: [FontVariation('wght', 700)],
      decoration: TextDecoration.lineThrough,
      color: Colors.grey);
}
