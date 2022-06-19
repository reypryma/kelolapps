import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/data/model/dayListModel/DayOpen.dart';
import 'package:kelolapps/data/model/selected_model.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/text_style.dart';

class StoreSignupDateFragment extends StatefulWidget {
  const StoreSignupDateFragment({Key? key}) : super(key: key);

  @override
  StoreSignupDateFragmentState createState() => StoreSignupDateFragmentState();
}

class StoreSignupDateFragmentState extends State<StoreSignupDateFragment> {
  List<KSelectOptionsModel> mDayList = [];
  List<String> selectedChoices = [];
  var mDay = 0;


  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
    // DayOpen.values.forEach((name) {
    //   mDayList.add(name.name);
    // });
    mDayList = getDayLists();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
/*    final mDayInfo = GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: mDayList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                mDay = index;
              });
            },
            child: Container(
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mDay == index
                      ? KelolakuGlobalColor.ocean
                      : KelolakuGlobalColor.light70),
              // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                mDayList[index],
                style: heading4.copyWith(
                    color: mDay == index
                        ? KelolakuGlobalColor.light70
                        : KelolakuGlobalColor.dark30),
              ).center(),
            ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        // crossAxisSpacing: 16,
        childAspectRatio: 2.0,
      ),
    );*/

    final mDayInfo =
      Wrap(
          spacing: 16,
          runSpacing: 16,
          children: mDayList.map((e) {
            //int index = mDayList.indexOf(e);
            return e.selected.validate() == true ?
            Container(
              alignment: Alignment.center,
              width: context.width() * 0.176,
              height: context.height() * 0.03940886699,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color: KelolakuGlobalColor.ocean
              ),
              // margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              child: Text(
                e.title.validate(),
                style: heading4.copyWith(
                    color: KelolakuGlobalColor.light70
                ),
                textAlign: TextAlign.center,
              ).onTap((){
                e.selected = !e.selected!;
                setState(() {});
              }),
            ) : Container(
              //If not selected
              alignment: Alignment.center,
              width: context.width() * 0.176,
              height: context.height() * 0.03940886699,
              decoration: BoxDecoration(
                border: Border.all(color: KelolakuGlobalColor.grayText),
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent
              ),
              // margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              child: Text(
                e.title.validate(),
                    style: heading4.copyWith(
                      color: KelolakuGlobalColor.dark30
                    ),
                textAlign: TextAlign.center,
              ).onTap((){
                e.selected = !e.selected!;
                setState(() {});
              }),
            );
          }).toList());


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
          margin: const EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: context.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: const Icon(Icons.arrow_back, color: KelolakuGlobalColor.dark),
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
            Container(
              margin: const EdgeInsets.only(top: 80),
              // padding: const EdgeInsets.only(
              //     top: 50, left: 16, right: 16, bottom: 16),
              width: context.width(),
              height: context.height(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // const SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
                    Container(
                        alignment: Alignment.topLeft,
                      height: 350,
                      // color: KelolakuGlobalColor.dark20.withAlpha(20),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: KelolakuGlobalColor.dark10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppString.selectOpeningDay,
                                style: heading2.copyWith(color: KelolakuGlobalColor.dark),
                              ),
                            ),
                          ),
                          // const SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
                          Container(
                            padding: const EdgeInsets.only(left: 10, bottom: Dimensions.VERTICAL_SIZE_16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppString.descSelectOpeningDay,
                                style: textRegular16.copyWith(color: KelolakuGlobalColor.dark40),
                              ),
                            ),
                          ),
                          mDayInfo,
                        ],
                      )
                    )
                  ],
                ),
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
                    width: (context.width() * 0.40533333333),
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        AppString.back,
                        style:
                            heading4.copyWith(color: KelolakuGlobalColor.ocean),
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
                    width: (context.width() * 0.40533333333),
                    text: AppString.next,
                    height: 60,
                    elevation: 0,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: KelolakuGlobalColor.colorPrimaryExtra,
                    textStyle: heading4.copyWith(color: Colors.white),
                    onTap: () {},
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
