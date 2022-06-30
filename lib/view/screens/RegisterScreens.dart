import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/route/route_helper.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import 'fragments/store_register/signup_store_name_fragment.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode phoneNumberFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  String? phone;
  String? name;
  String? password;
  bool autoValidate = false;
  bool passwordVisible = false;
  bool isLoading = false;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: white,
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22536945812,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: Dimensions.MARGIN_SIZE_GRID_8, right: Dimensions.MARGIN_SIZE_GRID_8),
                child: Text(
                  AppString.lblRegisterKelolaku,
                  style: heading1.copyWith(
                    color: KelolakuGlobalColor.dark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  formField(context, "Your Name", prefixIcon: Icons.person_outline, focusNode: nameFocus, textInputAction: TextInputAction.next, nextFocus: phoneNumberFocus,
                      onSaved: (String? value) {
                        setState(() {
                          name = value;
                        });
                      }).paddingBottom(8),
                  formField(context, "Phone Number", prefixIcon: Icons.phone_iphone, focusNode: phoneNumberFocus, textInputAction: TextInputAction.next, nextFocus: passwordFocus,
                      onSaved: (String? value) {
                        setState(() {
                          phone = value;
                        });
                      }).paddingBottom(8),
                  formField(context, "Password",
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      isPasswordVisible: passwordVisible,
                      focusNode: passwordFocus,
                      onSaved: (String? value) {
                        password = value;
                      },
                      textInputAction: TextInputAction.done,
                      suffixIconSelector: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      suffixIcon: passwordVisible ? Icons.visibility : Icons.visibility_off),
                ],
              ),
            ],
          ),
        ),
        _BottomButtonRegister()
      ],
    )));
  }

  Widget _BottomButtonRegister() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Dimensions.MARGIN_SIZE_GRID_8),
              child: AppButton(
                width: MediaQuery.of(context).size.width,
                height: 51,
                color: KelolakuGlobalColor.colorPrimaryLogo,
                //context.cardColor,
                text: AppString.lblSignUp,
                textColor: Colors.white,
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                    Get.to(StoreSignupNameFragment());
                },
                shapeBorder:
                    RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                padding: const EdgeInsets.all(16),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppString.lblAlreadyHaveAccount,
                style: textSemibold16.copyWith(
                  color: KelolakuGlobalColor.dark40,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 3,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.login);
                },
                child: Text(
                  AppString.lblLogin,
                  style: textSemibold16.copyWith(
                      color: KelolakuGlobalColor.ocean,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ).paddingBottom(Dimensions.BOTTOM_HEIGHT_GRID),
        ],
      ),
    );
  }
}
