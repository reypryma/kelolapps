import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolapps/view/screens/fragments/store_register/signup_store_name_fragment.dart';
import 'package:kelolapps/view/screens/fragments/store_register/store_signup_date_fragment.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../config/kelolaku/color_style.dart';
import '../../config/kelolaku/text_style.dart';
import '../../route/route_helper.dart';
import '../../utils/app_strings.dart';
import '../../utils/dimensions.dart';

class StoreRegisterWalkthroughScreen extends StatefulWidget {
  const StoreRegisterWalkthroughScreen({Key? key}) : super(key: key);

  @override
  _StoreRegisterWalkthroughScreenState createState() =>
      _StoreRegisterWalkthroughScreenState();
}

class _StoreRegisterWalkthroughScreenState
    extends State<StoreRegisterWalkthroughScreen> with AfterLayoutMixin<StoreRegisterWalkthroughScreen>{
  PageController pageController = PageController();
  double? currentPage = 0;
  List<Widget> pages = [];


  @override
  void initState() {
    pageController.addListener(
          () {
        setState(() {
          currentPage = pageController.page;
        });
      },
    );
  }


  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KelolakuGlobalColor.lightSmoke,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Container(
                  //     margin: const EdgeInsets.symmetric(
                  //         horizontal: Dimensions.MARGIN_SIZE_GRID_8),
                  //     child: AppButton(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 51,
                  //       color: KelolakuGlobalColor.colorPrimaryLogo,
                  //       //context.cardColor,
                  //       text: AppString.lblSignUp,
                  //       textColor: Colors.white,
                  //       onTap: () {
                  //         // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  //         //
                  //         // snackBar(context,
                  //         //     title: "Login Successful",
                  //         //     backgroundColor: KelolakuGlobalColor.colorPrimaryLogo);
                  //       },
                  //       shapeBorder: RoundedRectangleBorder(
                  //           borderRadius: radius(defaultRadius)),
                  //       padding: const EdgeInsets.all(16),
                  //     )),
                  DotIndicator(
                    indicatorColor: KelolakuGlobalColor.colorPrimaryLogo,
                    pageController: pageController,
                    pages: pages,
                    unselectedIndicatorColor: KelolakuGlobalColor.dark60,
                    onPageChanged: (index) {
                      setState(
                        () {
                          currentPage = index as double?;
                        },
                      );
                    },
                  ).paddingBottom(Dimensions.BOTTOM_HEIGHT_GRID),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
      pages = [
        SignupStoreNameFragment(),
        StoreSignupDateFragment(),
        StoreSignupDateFragment(),
      ];
  }
}
