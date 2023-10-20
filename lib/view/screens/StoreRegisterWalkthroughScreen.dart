import 'package:flutter/material.dart';
import 'package:kelolapps/view/screens/fragments/store_register/signup_store_info_fragment.dart';
import 'package:kelolapps/view/screens/fragments/store_register/signup_store_name_fragment.dart';
import 'package:kelolapps/view/screens/fragments/store_register/store_signup_date_fragment.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../config/kelolaku/color_style.dart';

class StoreRegisterWalkthroughScreen extends StatefulWidget {
  @override
  _StoreRegisterWalkthroughScreenState createState() =>
      _StoreRegisterWalkthroughScreenState();
}

class _StoreRegisterWalkthroughScreenState
    extends State<StoreRegisterWalkthroughScreen>
    with AfterLayoutMixin<StoreRegisterWalkthroughScreen> {
  final PageController pageController = PageController();
  double? currentPage = 0;

  // int currentPage = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController.addListener(
      () {
        setState(() {
          currentPage = pageController.page;
        });
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      StoreSignupNameFragment(),
      StoreSignupInfoFragment(),
      StoreSignupDateFragment(),
    ];
    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: KelolakuGlobalColor.lightSmoke,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
                controller: pageController,
                children: pages.map((e) => e).toList()),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child:
                    // SmoothPageIndicator(
                    //   controller: pageController,
                    //   count: 2,
                    //   axisDirection: Axis.horizontal,
                    //   effect: ExpandingDotsEffect(
                    //     dotColor: Color(0xff9e9e9e),
                    //     activeDotColor: KelolakuGlobalColor.colorPrimaryLogo,
                    //     dotHeight: 3,
                    //     dotWidth: 16,
                    //     radius: 16,
                    //     spacing: 8,
                    //     expansionFactor: 3,
                    //   ),
                    // ),
                    // DotIndicator(
                    //   indicatorColor: KelolakuGlobalColor.colorPrimaryLogo,
                    //   pages: pages, pageController: pageController,
                    //   unselectedIndicatorColor: grey,
                    //   onPageChanged: (index) {
                    //     setState(
                    //           () {
                    //         currentPage = index as double?;
                    //       },
                    //     );
                    //   },
                    // )
                    SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    dotColor: Color(0xff9e9e9e),
                    activeDotColor: KelolakuGlobalColor.colorPrimaryLogo,
                    dotHeight: 3,
                    dotWidth: 16,
                    radius: 16,
                    spacing: 8,
                    expansionFactor: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
