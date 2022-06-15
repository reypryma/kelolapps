// Routes using tag format
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kelolapps/view/screens/LoginScreens.dart';
import 'package:kelolapps/view/screens/RegisterScreens.dart';
import 'package:kelolapps/view/screens/StoreRegisterWalkthroughScreen.dart';

import '../splashscreen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    //ExampleScreenListing.tag: (context) => ExampleScreenListing(ClassContainsInfo()),
  };
}

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onBoarding = '/on-boarding';

  static const String login = '/login';

  static getLoginRoute(
          {required String username,
          required String phoneNumber,
          required String email}) =>
      "$login";

  static const String signUp = '/register';
  static getSignUpRoute() => '$signUp';

  static const String storeRegister = '/register-store';
  static getStoreRegisterRoute() => '$storeRegister';

  static List<GetPage> routes = [
    // GetPage(name: initial, page: () => DashboardScreen(pageIndex: 0)),
    GetPage(name: splash, page: () => const SplashScreenPage()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signUp, page: () => RegisterScreen()),
    GetPage(name: storeRegister, page: () => StoreRegisterWalkthroughScreen())
  ];
}
