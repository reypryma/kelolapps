import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

void transparentAppBar = () => {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light),
      )
    };

void primaryAppBar = () => {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: KelolakuGlobalColor.colorPrimaryExtra,
        systemNavigationBarIconBrightness: Brightness.light),
  )
};

void osSetStatusBarColor({required Color statusBarColor}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: statusBarColor), // status bar color
  );
}