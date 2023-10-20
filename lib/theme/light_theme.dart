import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

ThemeData lightKelolaku = ThemeData(
  fontFamily: 'Inter',
  primaryColor: KelolakuGlobalColor.colorPrimaryLogo,
  secondaryHeaderColor: Colors.white,
  hintColor: KelolakuGlobalColor.grayText,
  disabledColor: KelolakuGlobalColor.dark30,
  errorColor: KelolakuGlobalColor.orange60,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: KelolakuGlobalColor.bgFeedAlt),
  brightness: Brightness.light,
  cardColor: Colors.white,
  colorScheme: const ColorScheme.light(primary: KelolakuGlobalColor.colorPrimaryLogo, secondary: KelolakuGlobalColor.ocean),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: KelolakuGlobalColor().t3White)),
  appBarTheme: AppBarTheme(
    color: KelolakuGlobalColor.light70,
    iconTheme: IconThemeData(color: KelolakuGlobalColor.dark),
    systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
  ),
);