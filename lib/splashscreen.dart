import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/constant.dart';
import 'package:kelolapps/main.dart';
import 'package:kelolapps/route/route_helper.dart';
import 'package:kelolapps/view/screens/DashboardScreen.dart';
import 'package:kelolapps/view/screens/LoginScreens.dart';
import 'package:kelolapps/view/screens/digital_shop/DigitalShopHomeScreen2.dart';
import 'package:kelolapps/view/screens/fragments/store_register/signup_store_info_fragment.dart';
import 'package:kelolapps/view/test/learndir.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        _second--;
      });
      if (_second == 0) {
        _cancelFlashsaleTimer();
        // for this example we will use pushReplacement because we want to go back to the list
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));

        // if you use this splash screen on the very first time when you open the page, use below code
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => LoginScreen()),
        //     (Route<dynamic> route) => false);
        // Get.offNamed(RouteHelper.login);
        Get.to(() => DigitalStoreHomeScreen());
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    // set status bar color to transparent and navigation bottom color to black21
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    if (_second != 0) {
      _startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _cancelFlashsaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
            color: KelolakuGlobalColor.bgFeedAlt,
            alignment: Alignment.center,
            child: Image.asset(
              KelolaImage.kelolaLogoShort,
              width: MediaQuery.of(context).size.width / 2,
            )
            // ExplodeViewMain(imagePath: 'https://smartkit.wrteam.in/smartkit/foodmaster/splash_logo.png', imagePosFromLeft: MediaQuery.of(context).size.width / 2, imagePosFromTop: MediaQuery.of(context).size.height / 2),
            ),
      ),
    ));
  }
}
