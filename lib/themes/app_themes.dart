import 'package:first_app/constants/app_dimens.dart';
import 'package:flutter/material.dart';

const fontFamily = "Poppins";
const disabledColor = Color(0xFFbcbcbc);
const primaryColor = Color(0xFFFFCD06);
const lightPrimaryCplor = Color(0xFFFFE682);
const secondaryColor = Color(0xFF292A3b);
const alternativePrimary = Color(0xFF7d8390);
const shutleGrey = Color(0xFFf4f4f4);
const errorColor = Color(0xFFF76567);
const successColor = Color(0xFF00da9f);
const warningColor = Color(0xFFfce8bb);
const warningIconColor = Color(0xFFf3b31c);
const darkGrey = Color(0xFF959595);
const lightGrey = Color(0xFFe4e4e4);
const cardGrey = Color(0xFFF4F4F4);
const cursorColor = Color(0xFF666666);
const bodyColor = Color(0xFF000000);
const buttonColor = Color(0xFF000000);
const inputSuffixIconClor = Color(0xFF6dd819);

const errorBorder = OutlineInputBorder(
  borderRadius: AppDimens.inputBorderRadius,
  borderSide: BorderSide(
    color: errorColor,
  ),
);

const enabledBorder = OutlineInputBorder(
  borderRadius: AppDimens.inputBorderRadius,
  borderSide: BorderSide(
    color: lightGrey,
  ),
);

const focusedBorder = OutlineInputBorder(
  borderRadius: AppDimens.inputBorderRadius,
  borderSide: BorderSide(
    color: darkGrey,
  ),
);

abstract class AppThemes {
  static ThemeData light = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    errorColor: errorColor,
    textSelectionTheme: ThemeData.light().textSelectionTheme.copyWith(
          cursorColor: cursorColor,
        ),
    textTheme: ThemeData.light()
        .textTheme
        .apply(
          bodyColor: bodyColor,
          fontFamily: fontFamily,
        )
        .copyWith(
          bodyText1: ThemeData.light().textTheme.bodyText1?.copyWith(
                fontSize: AppDimens.bodyFontSize,
              ),
        ),
    inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
          contentPadding: AppDimens.inputPadding,
          fillColor: Colors.white,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: ThemeData.light()
        .cardTheme
        .copyWith(margin: const EdgeInsets.symmetric(vertical: 4)),
  );
}
