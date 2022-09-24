import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme_color.dart';
import 'theme_text.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'TTCommons',
    primaryColor: AppColor.primaryColor,
    textTheme: ThemeText.getDefaultTextTheme(),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    scaffoldBackgroundColor: AppColor.white,
    toggleableActiveColor: AppColor.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.black,
        disabledForegroundColor: AppColor.primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: AppColor.white
    )
  );
}