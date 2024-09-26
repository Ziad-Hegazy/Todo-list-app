import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../styles/colors.dart';
import '../styles/font.dart';

class AppTheme {
  static ThemeData main = ThemeData(
    colorScheme: appScheme,
    scaffoldBackgroundColor: appScheme.surface,
    appBarTheme: AppBarTheme(
        foregroundColor: AppColors.black,
        centerTitle: false,
        toolbarHeight: 150,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            systemNavigationBarColor: appScheme.surface,
            statusBarColor: Colors.white)),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.FieldText,
    ),
    bottomSheetTheme: ThemeData.light().bottomSheetTheme.copyWith(
          backgroundColor: AppColors.white,
        ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.grey,
      filled: true,
      labelStyle: AppTextStyles.FieldText.copyWith(color: Colors.black54),
      hintStyle: AppTextStyles.FieldText.copyWith(color: Colors.black54),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      enabledBorder: inputBorder.copyWith(borderSide: BorderSide.none),
      //focusedBorder: inputBorder.copyWith(borderSide:borderSide.copyWith(color: appScheme.surface)),
      errorBorder: inputBorder.copyWith(
          borderSide: borderSide.copyWith(color: appScheme.error)),
      focusedErrorBorder: inputBorder.copyWith(
          borderSide: borderSide.copyWith(color: appScheme.onSurface)),
      errorStyle: AppTextStyles.FieldText.copyWith(
          color: AppColors.black, fontSize: 15),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelStyle: AppTextStyles.FieldText.copyWith(fontSize: 20),
    ),
    filledButtonTheme: filledButton,
    outlinedButtonTheme: outlinedButton,
    elevatedButtonTheme: elevatedButton,
    expansionTileTheme: expansionTile,
    listTileTheme: listTile,
    textButtonTheme: textButton,
  );

  static BorderSide borderSide = BorderSide(
      color: AppColors.white,
      width: 3,
      strokeAlign: BorderSide.strokeAlignOutside);

  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
        color: AppColors.white,
        width: 3,
        strokeAlign: BorderSide.strokeAlignOutside),
    borderRadius: BorderRadius.circular(13),
  );

  static FilledButtonThemeData filledButton = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 8),
      fixedSize: Size(420, 60),
      textStyle: AppTextStyles.buttonText.copyWith(color: AppColors.white),
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );

  static OutlinedButtonThemeData outlinedButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 8),
      fixedSize: Size(420, 60),
      textStyle: AppTextStyles.buttonText.copyWith(color: AppColors.white),
      foregroundColor: AppColors.white,
      side: BorderSide(
          width: 3,
          color: AppColors.black,
          strokeAlign: BorderSide.strokeAlignOutside),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );

  static ElevatedButtonThemeData elevatedButton = ElevatedButtonThemeData(
    style: FilledButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 8),
      fixedSize: Size(420, 70),
      textStyle: AppTextStyles.buttonText.copyWith(color: AppColors.white),
      backgroundColor: appScheme.primary,
      foregroundColor: appScheme.onPrimary,
      shadowColor: AppColors.lightBlack,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );

  static ExpansionTileThemeData expansionTile = ExpansionTileThemeData(
    backgroundColor: AppColors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    tilePadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
    childrenPadding: EdgeInsets.only(top: 0, bottom: 25),
  );

  static ListTileThemeData listTile = ListTileThemeData(
    dense: true,
    //minTileHeight: 0,
    //minVerticalPadding: 0,
    visualDensity: VisualDensity(vertical: -4),
    titleTextStyle: AppTextStyles.task,
    contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
  );

  static TextButtonThemeData textButton = TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: AppColors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
  ));
}
