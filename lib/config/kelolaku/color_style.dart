import 'dart:ui';

import 'package:flutter/material.dart';

class KelolakuGlobalColor {
  static const colorPrimaryLogo = Color(0xFF03989E);
  static const colorPrimaryExtra = Color(0xFF17A0B0);

// Gray
  static const grayFed = Color(0xFF7A848C);
  static const grayText = Color(0xFF7D7B7B);

// Basic Background
  static const bgFeedAlt = Color(0xFFF3F6F9);

//other colors
  static const purpleBlack = Color(0xFF1E3354);
  static const orangeFeed = Color(0xFFF26333);

// Adaptive Colors
// 01 Ocean
  static const ocean10 = Color(0xFFF2FDFB);
  static const ocean20 = Color(0xFFBFDEF0);
  static const ocean30 = Color(0xFF80DAC4);
  static const ocean40 = Color(0xFF40C7A7);
  static const ocean = Color(0xFF00B589);
  static const ocean60 = Color(0xFF008867);
  static const ocean70 = Color(0xFF005B45);

// 02 Dark
  static const dark10 = Color(0xFFF2F4F5);
  static const dark20 = Color(0xFFCACDCF);
  static const dark30 = Color(0xFF949A9F);
  static const dark40 = Color(0xFF5F686F);
  static const dark = Color(0xFF2A353F);
  static const dark60 = Color(0xFF1E282E);
  static const dark70 = Color(0xFF000000);

// 03 Light
  static const light = Color(0xFF6D95BD);
  static const light60 = Color(0xFFF3F6F9);
  static const light70 = Color(0xFFFFFFFF);
  static const lightSmoke = Color(0xFFFFFDFD);
  static const lightBorderInput = Color(0xFFD8E0F0);

// 04 Red
  static const red10 = Color(0xFFFFF4F5);
  static const red20 = Color(0xFFF6C9CC);
  static const red30 = Color(0xFFEE9499);
  static const red40 = Color(0xFFE55E67);
  static const red = Color(0xFFDC2934);
  static const red60 = Color(0xFFA51F27);
  static const red70 = Color(0xFF6E141A);

// 05 Green
  static const green10 = Color(0xFFF3FFF7);
  static const green20 = Color(0xFFC0EACF);
  static const green30 = Color(0xFF81D69E);
  static const green40 = Color(0xFF43C16E);
  static const green = Color(0xFF04AC3D);
  static const green60 = Color(0xFF03812E);
  static const green70 = Color(0xFF02561E);

  static const yellow10 = Color(0xFFFFFCF1);
  static const yellow20 = Color(0xFFFAEEC5);
  static const yellow30 = Color(0xFFF6DD8B);
  static const yellow40 = Color(0xFFF1CC52);
  static const yellow = Color(0xFFECBB18);
  static const yellow60 = Color(0xFFB18C12);
  static const yellow70 = Color(0xFF765D0C);

  static const purple10 = Color(0xFFF6F5FF);
  static const purple20 = Color(0xFFD4D2F8);
  static const purple30 = Color(0xFFA9A4F1);
  static const purple40 = Color(0xFF7E77EA);
  static const purple = Color(0xFF534AE3);
  static const purple60 = Color(0xFF3E37AA);
  static const purple70 = Color(0xFF292572);

  static const orange10 = Color(0xFFFFF4F0);
  static const orange20 = Color(0xFFFAD9CF);
  static const orange30 = Color(0xFFF5B3A0);
  static const orange40 = Color(0xFFF08E71);
  static const orange = Color(0xFFEB6841);
  static const orange60 = Color(0xFFB04E31);
  static const orange70 = Color(0xFF763420);

  static const deepBlue10 = Color(0xFFF3F8FF);
  static const deepBlue20 = Color(0xFFC7DCFB);
  static const deepBlue30 = Color(0xFF90BAF7);
  static const deepBlue40 = Color(0xFF5897F2);
  static const deepBlue = Color(0xFF2174EE);
  static const deepBlue60 = Color(0xFF1957B3);
  static const deepBlue70 = Color(0xFF103A77);

  static const skyBlue10 = Color(0xFFF1FAFF);
  static const skyBlue20 = Color(0xFFCBEBFE);
  static const skyBlue30 = Color(0xFF98D8FC);
  static const skyBlue40 = Color(0xFF65C5FB);
  static const skyBlue = Color(0xFF31B1F9);
  static const skyBlue60 = Color(0xFF2585BB);
  static const skyBlue70 = Color(0xFF18597D);

  static const t3_shadow = Color(0x70E2E2E5);
  var t3White = materialColor(0xFFFFFFFF);
  static const shadow_color = Color(0x95E9EBF0);
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0XFF5959fc, color);
