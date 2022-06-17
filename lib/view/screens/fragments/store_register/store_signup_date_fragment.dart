import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/text_style.dart';

class StoreSignupDateFragment extends StatefulWidget {
  @override
  StoreSignupDateFragmentState createState() => StoreSignupDateFragmentState();
}

class StoreSignupDateFragmentState extends State<StoreSignupDateFragment> {
  var mDayList;
  var mDay = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
    mDayList = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
  }



  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    final mDayInfo = GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: mDayList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              mDay = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mDay == index
                    ? KelolakuGlobalColor.ocean
                    : KelolakuGlobalColor.light70),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              mDayList[index],
              style: heading4.copyWith(
                  color: mDay == index
                      ? KelolakuGlobalColor.light70
                      : KelolakuGlobalColor.dark30
            ),
          ).center(),
        )
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2.0,
      ),
    );

    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppString.lblInfoStore,
          style: heading1.copyWith(color: KelolakuGlobalColor.dark),
        ),
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: context.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Icon(Icons.arrow_back, color: KelolakuGlobalColor.dark),
        ).onTap(() {
          finish(context);
        }),
        centerTitle: true,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06666),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                  )
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: (context.width() * 0.40533333333 ),
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        AppString.back,
                        style: heading4.copyWith(
                            color: KelolakuGlobalColor.ocean
                        ),
                      ),
                      // width: (context.width() - (3 * 16)) * 0.5,
                      // height: 60,
                      // text: AppString.back,
                      // textStyle: boldTextStyle(),
                      // shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      // elevation: 0,
                      // onTap: () {
                      //
                      // },
                      // color: grey.withOpacity(0.1),
                      // hoverColor: Colors.transparent,
                      // splashColor: Colors.transparent,
                      // focusColor: Colors.transparent,
                    ),
                  ),
                  AppButton(
                    width: (context.width() * 0.40533333333 ),
                    text: AppString.next,
                    height: 60,
                    elevation: 0,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: KelolakuGlobalColor.colorPrimaryExtra,
                    textStyle: heading4.copyWith(
                        color: Colors.white
                    ),
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
