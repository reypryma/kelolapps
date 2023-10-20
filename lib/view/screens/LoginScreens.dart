
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolapps/config/image.dart';

import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/route/route_helper.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
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
      body: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
            child: Column(
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height / 2,
                //   width: MediaQuery.of(context).size.width,
                //   color: tomato,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0701970443,
                ),
                Image.asset(
                  KelolaImage.kelolaLogoShort,
                  width: MediaQuery.of(context).size.width * 0.24,
                  height: MediaQuery.of(context).size.height * 0.145320197,
                  ),
                const SizedBox(
                  height: Dimensions.MARGIN_SIZE_GRID_6,
                ),
                Container(
                  padding: const EdgeInsets.only(left: Dimensions.MARGIN_SIZE_GRID_8, right: Dimensions.MARGIN_SIZE_GRID_8),
                  child: Text(
                    AppString.lblWelcomeLogin,
                    style: title20.copyWith(
                      color: KelolakuGlobalColor.dark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 3
                ),
                Column(
                  // children: [
                  //   Container(
                  //       alignment:  Alignment.centerLeft,
                  //       margin: const EdgeInsets.only(top: Dimensions.MARGIN_SIZE_SMALL),
                  //       child: Text(AppString.userName, style: heading4.copyWith(color: KelolakuGlobalColor.dark60), textAlign: TextAlign.left,)).paddingLeft(Dimensions.MARGIN_SIZE_GRID_8),
                  //
                  // ],
                  children: [
                      Container(
                          alignment:  Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: Dimensions.MARGIN_SIZE_GRID_6),
                          child: Text(AppString.userName, style: heading4.copyWith(color: KelolakuGlobalColor.grayText), textAlign: TextAlign.left,)).paddingSymmetric(vertical: 10),
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

                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Container(),

                      ),
                      Container(
                        child: AppButton(
                          width: MediaQuery.of(context).size.width,
                          height: 51,
                          color: KelolakuGlobalColor.colorPrimaryLogo,
                          //context.cardColor,
                          text: AppString.lblLogin,
                          textColor: Colors.white,
                          onTap: () {
                            // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            //
                            // snackBar(context,
                            //     title: "Login Successful",
                            //     backgroundColor: KelolakuGlobalColor.colorPrimaryLogo);
                          },
                          shapeBorder:
                              RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                          padding: const EdgeInsets.all(16),
                        ).paddingBottom(Dimensions.VERTICAL_SIZE_8)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.lblNotHaveAccount,
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
                              Get.toNamed(RouteHelper.signUp);
                            },
                            child: Text(
                              AppString.lblSignUp,
                              style: textSemibold16.copyWith(
                                color: KelolakuGlobalColor.ocean,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ).paddingBottom(Dimensions.BOTTOM_HEIGHT_GRID),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
