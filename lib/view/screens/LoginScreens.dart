import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../config/image.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: white,
          child: Column(
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height / 2,
              //   width: MediaQuery.of(context).size.width,
              //   color: tomato,
              // ),
              SizedBox(
                height: context.height() * 0.0701970443,
              ),
              Image.asset(
                KelolaImage.kelolaLogoShort,
                width: MediaQuery.of(context).size.width * 0.24,
                height: context.height() * 0.145320197,
                ),
              const SizedBox(
                height: Dimensions.MARGIN_SIZE_SMALL,
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
              Container(
                  alignment:  Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: Dimensions.MARGIN_SIZE_SMALL),
                  child: Text(AppString.userName, style: heading4.copyWith(color: KelolakuGlobalColor.dark60), textAlign: TextAlign.left,)).paddingLeft(Dimensions.MARGIN_SIZE_GRID_8),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Container(),
                      
                    ),
                    Container(
                      color: tomato,
                      child: AppButton(
                        width: context.width() * 0.92,
                        height: 51,
                        color: KelolakuGlobalColor.colorPrimaryLogo,
                        //context.cardColor,
                        text: AppString.lblLogin,
                        textColor: Colors.white,
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();

                          snackBar(context,
                              title: "Login Successful}",
                              backgroundColor: KelolakuGlobalColor.colorPrimaryLogo);
                        },
                        shapeBorder:
                            RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                        padding: const EdgeInsets.all(16),
                      ).paddingBottom(Dimensions.PADDING_SIZE_EXTRA_SMALL)
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
                        Text(
                          AppString.lblSignUp,
                          style: textSemibold16.copyWith(
                            color: KelolakuGlobalColor.ocean,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ).paddingBottom(32),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
