import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/data/model/dayListModel/DayOpen.dart';
import 'package:kelolapps/data/model/selected_model.dart';
import 'package:kelolapps/utils/AppWidget.dart';
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
  late TimeOfDay selectedOpenTime, selectedClosedTime;
  var mDay = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    mDayList = getDayLists();
    selectedOpenTime = TimeOfDay.now();
    selectedClosedTime = TimeOfDay.now();
  }

  Future<Null> _selectTime(BuildContext context, TimeOfDay selectedTime, int option) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return CustomTheme(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!,
            ),
          );
        });

    if (picked != null) {
      setState(() {
        option == 1 ? selectedOpenTime = picked : selectedClosedTime = picked;
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    final mDayInfo = Wrap(
        spacing: 16,
        runSpacing: 16,
        children: mDayList.map((e) {
          //int index = mDayList.indexOf(e);
          return Container(
              alignment: Alignment.center,
              width: context.width() * 0.176,
              height: context.height() * 0.03940886699,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //If true color box ocean
                  color: e.selected.validate()
                      ? KelolakuGlobalColor.ocean
                      : Colors.transparent,
                  border: e.selected.validate()
                      ? Border.all(style: BorderStyle.none)
                      : Border.all(color: KelolakuGlobalColor.grayFed)),
              // margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              child: Text(
                e.title.validate(),
                style: heading4.copyWith(
                    color: e.selected.validate()
                        ? KelolakuGlobalColor.light70
                        : KelolakuGlobalColor.grayText),
                textAlign: TextAlign.center,
              ).onTap(() {
                e.selected = !e.selected!;
                setState(() {});
              }));
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
                                  style: heading2.copyWith(
                                      color: KelolakuGlobalColor.dark),
                                ),
                              ),
                            ),
                            // const SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: Dimensions.VERTICAL_SIZE_16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppString.descSelectOpeningDay,
                                  style: textRegular16.copyWith(
                                      color: KelolakuGlobalColor.dark40),
                                ),
                              ),
                            ),
                            mDayInfo,
                          ],
                        )
                    ),
                    const SizedBox(
                      height: Dimensions.VERTICAL_SIZE_16,
                    ),
                    Container(
                      width: context.width(),
                      // margin: const EdgeInsets.symmetric(
                      //     horizontal: Dimensions.MARGIN_SIZE_GRID_4),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child:
                          Card(
                              elevation: 4,
                              child: ListTile(
                                onTap: () {
                                  _selectTime(context, selectedOpenTime, 1);
                                },
                                title: Text(
                                  AppString.chooseTimeOpen,
                                  style: heading3.copyWith(color: KelolakuGlobalColor.dark),
                                ),
                                subtitle: Text(
                                  "${selectedOpenTime.hour < 10 ? "0${selectedOpenTime.hour}" : "${selectedOpenTime.hour}"} : ${selectedOpenTime.minute < 10 ? "0${selectedOpenTime.minute}" : "${selectedOpenTime.minute}"} ${selectedOpenTime.period != DayPeriod.am ? 'PM' : 'AM'}   ",
                                  style: textRegular16.copyWith(
                                      color: KelolakuGlobalColor.dark
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: KelolakuGlobalColor.dark,
                                  ),
                                  onPressed: () {
                                    _selectTime(context, selectedOpenTime, 1);
                                    setState(() {});
                                  },
                                ),
                              ))),
                          Flexible(flex: 1, child: Card(
                              elevation: 4,
                              child: ListTile(
                                onTap: () {
                                  _selectTime(context, selectedClosedTime, 2);
                                },
                                title: Text(
                                  AppString.chooseTimeClosed,
                                  style: heading3.copyWith(color: KelolakuGlobalColor.dark),
                                ),
                                subtitle: Text(
                                  "${selectedClosedTime.hour < 10 ? "0${selectedClosedTime.hour}" : "${selectedClosedTime.hour}"} : ${selectedClosedTime.minute < 10 ? "0${selectedClosedTime.minute}" : "${selectedClosedTime.minute}"} ${selectedClosedTime.period != DayPeriod.am ? 'PM' : 'AM'}   ",
                                  style: textRegular16.copyWith(
                                      color: KelolakuGlobalColor.dark
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: KelolakuGlobalColor.dark,
                                  ),
                                  onPressed: () {
                                    _selectTime(context, selectedClosedTime, 2);
                                    setState(() { });
                                  },
                                ),
                              )))
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimensions.VERTICAL_SIZE_32,),
                    TextFormField(
                      style: textRegular12.copyWith(
                          color: Colors.grey.shade600
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          borderSide: BorderSide(color: KelolakuGlobalColor.colorPrimaryExtra),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          borderSide: BorderSide(width: 1, color: KelolakuGlobalColor.lightBorderInput),
                        ),
                        labelText: AppString.extraStoreAvailable,
                        hintMaxLines: 2,
                        labelStyle: textRegular16.copyWith(
                            color: KelolakuGlobalColor.dark40
                        ),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 5,
                      cursorColor: blackColor,
                      keyboardType: TextInputType.multiline,
                      validator: (s) {
                        if (s!.trim().isEmpty) return 'Masukkan Dekripsi Toko misal tentang usaha \n dan produk yang tersedia';
                        return null;
                      },
                    ),
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
