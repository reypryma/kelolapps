import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/countrypicker/country_code_picker.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/view/screens/fragments/store_register/store_signup_date_fragment.dart';
import 'package:kelolapps/view/screens/sheets/get_picture_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/color_style.dart';
import '../../../../config/kelolaku/constant.dart';

class StoreSignupInfoFragment extends StatefulWidget {
  static String tag = '/StoreSignupInfoFragment';
  final isEditProfile;

  StoreSignupInfoFragment({this.isEditProfile});

  @override
  StoreSignupInfoFragmentState createState() => StoreSignupInfoFragmentState();
}

class StoreSignupInfoFragmentState extends State<StoreSignupInfoFragment> {
  PickedFile? pickImage;
  String fileName = '', filePath = '';

  var formKey = GlobalKey<FormState>();
  var autoValidate = false;

  var usernameCont = TextEditingController();
  var emailCont = TextEditingController();
  var phoneCont = TextEditingController();
  var addressCont = TextEditingController();
  var descriptionCont = TextEditingController();

  var addressFocus = FocusNode();
  var description = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  Future getImage() async {
    pickImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickImage != null) {
      fileName = pickImage!.path.split('/').last;
      filePath = pickImage!.path;
      setState(() {});
    }
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
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
            child: const Icon(Icons.arrow_back, color: KelolakuGlobalColor.dark),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06666),
          // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                padding:
                    EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
                width: context.width(),
                height: context.height(),
                // decoration: boxDecorationWithShadow(backgroundColor: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          // padding: EdgeInsets.all(12),
                          shapeBorder:
                              RoundedRectangleBorder(borderRadius: radius(5)),
                          color: KelolakuGlobalColor.colorPrimaryExtra,
                          text: 'Unggah Gambar untuk Toko',
                          textStyle: heading5.copyWith(color: Colors.white),
                          onTap: () {
                              // Get.to(FileManagerBottomSheet());
                            showPictureChooserSheet(context);
                          },
                        ),
                      ),
                      const SizedBox(height: Dimensions.VERTICAL_SIZE_32,),
                      Text(
                        AppString.lblNumberContactStore,
                        style: title16.copyWith(
                          color: KelolakuGlobalColor.dark
                        ),
                      ),
                      SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: boxDecoration(showShadow: false, bgColor: Colors.white, radius: 8, color: KelolakuGlobalColor.dark),
                            padding: EdgeInsets.all(1),
                            child: CountryCodePicker(onChanged: print, showFlag: false, padding: EdgeInsets.all(0)),
                          ),
                          SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              decoration: boxDecoration(showShadow: true, bgColor: Colors.white, radius: 8, color: KelolakuGlobalColor.lightBorderInput),
                              // padding: EdgeInsets.all(0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                style: const TextStyle(fontSize: textSizeLargeMedium, fontFamily: "Regular"),
                                decoration: const InputDecoration(
                                  counterText: "",
                                  contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                                  hintText: "8573511232",
                                  prefixIcon: Icon(Icons.call, color: black),
                                  hintStyle: TextStyle(color: KelolakuGlobalColor.light, fontSize: textSizeMedium),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: Dimensions.VERTICAL_SIZE_32,),
                      Text(
                        AppString.lblAlamat,
                        style: heading3.copyWith(
                            color: KelolakuGlobalColor.dark
                        ),
                      ),
                      const SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
                      TextFormField(
                        controller: addressCont,
                        focusNode: addressFocus,
                        style: textRegular12.copyWith(
                            color: Colors.grey.shade600
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: BorderSide(color: KelolakuGlobalColor.colorPrimaryExtra),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: BorderSide(width: 1, color: KelolakuGlobalColor.lightBorderInput),
                          ),
                          labelText: AppString.hintAlamat,
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
                      const SizedBox(height: Dimensions.VERTICAL_SIZE_16,),
                      Text(
                        AppString.lblStoreDescription,
                        style: title16.copyWith(
                            color: KelolakuGlobalColor.dark
                        ),
                      ),
                      const SizedBox(height: Dimensions.VERTICAL_SIZE_8,),
                      TextFormField(
                        controller: descriptionCont,
                        focusNode: description,
                        style: textRegular12.copyWith(
                            color: Colors.grey.shade600
                        ),
                        decoration: InputDecoration(
                          // prefixIcon: Icon(
                          //   Icons.location_on,
                          //   color: Colors.grey,
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: BorderSide(color: KelolakuGlobalColor.colorPrimaryExtra),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: BorderSide(width: 1, color: KelolakuGlobalColor.lightBorderInput),
                          ),
                          labelText: 'Masukkan Dekripsi Toko misal tentang usaha dan produk yang tersedia',
                          labelStyle: textRegular16.copyWith(
                              color: KelolakuGlobalColor.dark40
                          ),
                          alignLabelWithHint: true,
                        ),
                        maxLines: 5,
                        cursorColor: blackColor,
                        keyboardType: TextInputType.multiline,
                        validator: (s) {
                          if (s!.trim().isEmpty) return 'Masukkan Dekripsi Toko misal tentang usaha dan produk yang tersedia';
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //Upload Image
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                        color: KelolakuGlobalColor.ocean,
                        shape: BoxShape.circle),
                    child: pickImage == null ? Image.asset(KelolaImage.uploadStoreImageCircle) :  Image.file(File(pickImage!.path), fit: BoxFit.cover),

                    ),
                  // Positioned(
                  //   bottom: 16,
                  //   child: Container(
                  //     padding: EdgeInsets.all(6),
                  //     child: Icon(Icons.edit, color: Colors.white, size: 20),
                  //     decoration: BoxDecoration(color: KelolakuGlobalColor.light, shape: BoxShape.circle),
                  //   ),
                  // ),
                ],
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
                        // await getImage();
                        Get.to(StoreSignupDateFragment());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ).paddingTop(60),
        ),
      ),
    );
  }
}
